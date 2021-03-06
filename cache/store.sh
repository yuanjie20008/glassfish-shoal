#! /bin/sh
#
# Copyright (c) 2010, 2018 Oracle and/or its affiliates. All rights reserved.
#
# This program and the accompanying materials are made available under the
# terms of the Eclipse Public License v. 2.0, which is available at
# http://www.eclipse.org/legal/epl-2.0.
#
# This Source Code may also be made available under the following Secondary
# Licenses when the conditions for such availability set forth in the
# Eclipse Public License v. 2.0 are satisfied: GNU General Public License,
# version 2 with the GNU Classpath Exception, which is available at
# https://www.gnu.org/software/classpath/license.html.
#
# SPDX-License-Identifier: EPL-2.0 OR GPL-2.0 WITH Classpath-exception-2.0
#

usage() {
    echo "Usage:"
    echo "    shell <membername> "
    exit 0
}

if [ $# -lt 1 ]; then
     echo "Error: membername must be specified"
     usage
fi
if [ "${1}" = "-h" ]; then
     usage
fi

CACHE_HOME=.
HA_API_JAR=/space/work/ha-api/target/ha-api-3.1.10-SNAPSHOT.jar

CP=${HA_API_JAR}:${CACHE_HOME}/target/classes:${CACHE_HOME}/../gms/api/target/shoal-gms-api.jar:${CACHE_HOME}/../gms/impl/target/shoal-gms-impl.jar:${CACHE_HOME}/../gms/lib/grizzly-framework.jar:${CACHE_HOME}/../gms/lib/grizzly-utils.jar


echo java -cp ${CP}  org.shoal.ha.cache.impl.util.StoreableBackingStoreShell cache $1 shoal-shell-group
java -cp ${CP}  org.shoal.ha.cache.impl.util.StoreableBackingStoreShell cache $1 shoal-shell-group
