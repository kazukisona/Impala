# Copyright 2016 Cloudera Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# This file is intended to be sourced to perform common setup for
# $IMPALA_HOME/bin/impala-py* executables.

set -euo pipefail
trap 'echo Error in $0 at line $LINENO: $(cd "'$PWD'" && awk "NR == $LINENO" $0)' ERR

LD_LIBRARY_PATH+=":$(python $IMPALA_HOME/infra/python/bootstrap_virtualenv.py \
  --print-ld-library-path)"

PY_DIR=$(dirname "$0")/../infra/python
python "$PY_DIR/bootstrap_virtualenv.py"
