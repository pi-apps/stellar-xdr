// Copyright 2022 Stellar Development Foundation and contributors. Licensed
// under the Apache License, Version 2.0. See the COPYING file at the root
// of this distribution or at http://www.apache.org/licenses/LICENSE-2.0

// The contract spec XDR is highly experimental, incomplete, and still being
// iterated on. Breaking changes expected.

% #include "xdr/Stellar-types.h"
namespace stellar
{

enum SCEnvMetaKind
{
    // Env interface version (protocol version << 32 | prerelease version).
    // Deprecated.
    SC_ENV_META_KIND_INTERFACE_VERSION = 0,
    // Env protocol version that the contract is built against.
    SC_ENV_META_KIND_PROTOCOL_VERSION = 1,
    // Env pre-release version that the contract is built against. Present for
    // contracts built against pre-release builds of the env only.
    SC_ENV_META_KIND_PRE_RELEASE_VERSION = 2
};

union SCEnvMetaEntry switch (SCEnvMetaKind kind)
{
case SC_ENV_META_KIND_INTERFACE_VERSION:
    uint64 interfaceVersion;
case SC_ENV_META_KIND_PROTOCOL_VERSION:
    uint32 protocolVersion;
case SC_ENV_META_KIND_PRE_RELEASE_VERSION:
    uint32 preReleaseVersion;
};

}
