#!/usr/bin/env bash

# Copyright 2018 The Knative Authors
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

set -o errexit
set -o nounset
set -o pipefail

source $(dirname $0)/../vendor/github.com/knative/test-infra/scripts/library.sh

cd ${REPO_ROOT_DIR}

# Ensure we have everything we need under vendor/
dep ensure

rm -rf $(find vendor/ -name 'OWNERS')
rm -rf $(find vendor/ -name 'BUILD')
rm -rf $(find vendor/ -name 'BUILD.bazel')
rm -fr vendor/github.com/knative/test-infra/devstats

update_licenses third_party/VENDOR-LICENSE "./cmd/*" "./contrib/github/cmd/*" "./contrib/gcppubsub/cmd/*" "./kafka/source/cmd/*" "./contrib/awssqs/cmd/*"
