#!/usr/bin/python
# -*- coding: utf-8 -*-

# (c) 2018, Sviatoslav Sydorenko
#
# GNU General Public License v3.0+ (see COPYING or https://www.gnu.org/licenses/gpl-3.0.txt)

"""Support for Eix software under Gentoo."""
from __future__ import absolute_import, print_function, unicode_literals
__metaclass__ = type


ANSIBLE_METADATA = {'metadata_version': '1.1',
                    'status': ['preview'],
                    'supported_by': 'community'}


DOCUMENTATION = """
---
module: eix
short_description: eix portage tree database for Gentoo
description:
  - Manages, syncx and indexes Gentoo portage tree
version_added: "2.6"

options:
  action:
    description: >
      eix action to perform
    required: true
    default: "update"
    choices: [ "sync", "update" ]

requirements: [ eix ]
author:
    - "Sviatoslav Sydorenko (@webknjaz)"
notes:  []
"""


EXAMPLES = """
# Update eix db
- eix:
    action: update

# Sync and update eix db
- eix:
    action: sync
"""


import six

from ansible.module_utils.basic import AnsibleModule


class EixModuleError(RuntimeError):
    def __init__(self, msg, error_args={}, *args, **kwargs):
        super(EixModuleError, self).__init__(msg, *args, **kwargs)

        self.error_args = error_args
        self.error_args['msg'] = self.error_args.get('msg', msg)


class InvalidEixParamError(EixModuleError):
    pass


class InvalidEixActionError(InvalidEixParamError):
    pass


class EixCmdFailedError(EixModuleError):
    def __init__(self, msg, error_args={}, *args, **kwargs):
        for arg in 'cmd', 'rc':
            assert arg in error_args

        super(EixCmdFailedError, self).__init__(
            msg, error_args=error_args,
            *args, **kwargs,
        )


class EixAnsibleModule(AnsibleModule):
    def __init__(self):
        super(EixAnsibleModule, self).__init__(
            argument_spec=dict(
                action=dict(default='update', choices=['sync', 'update']),
            ),
            required_one_of=[['action']],
            supports_check_mode=False,
        )

        self.eix_path = self.get_bin_path('eix', required=True)
        self.eix_sync_path = self.get_bin_path('eix-sync', required=True)
        self.eix_update_path = self.get_bin_path('eix-update', required=True)

    @property
    def action_name(self):
        return self.params['action']

    @property
    def dispatch(self):
        try:
            return getattr(self, self.action_name)
        except AttributeError as attr_err:
            six.raise_from(
                InvalidEixActionError(
                    "There's no such action: {}".format(self.action_name),
                    error_args={},
                ),
                attr_err,
            )

    def run(self):
        """Execute action chosen."""
        try:
            action_result = self.dispatch()
            self.exit_json(
                msg='{} completed.'.format(self.action_name.title()),
                **action_result,
            )
        except EixModuleError as mod_err:
            self.fail_json(**mod_err.error_args,)

    def run_or_raise(self, cmd):
        rc, out, err = self.run_command(cmd + self.default_args, environ_update={'EMERGE_DEFAULT_OPTS': '--ask=n'})
        res = {
            'cmd': cmd,
            'rc': rc,
            'stdout': out,
            'stderr': err,
        }

        if rc != 0:
            raise EixCmdFailedError(
                'Running `{}` was unsuccessful'.
                format(' '.join(cmd)),
                error_args=res,
            )

        return res

    @property
    def default_args(self):
        #return []
        return ['quiet']

    def update(self):
        """Update the eix database."""
        cmd_exec_args = [self.eix_update_path]
        return self.run_or_raise(cmd_exec_args)

    def sync(self):
        """Sync portage/overlay trees and update the eix database."""
        cmd_exec_args = [self.eix_sync_path]
        return self.run_or_raise(cmd_exec_args)


if __name__ == '__main__':
    EixAnsibleModule().run()
