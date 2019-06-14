{ lib, buildRustCrate, buildRustCrateHelpers }:
with buildRustCrateHelpers;
let inherit (lib.lists) fold;
    inherit (lib.attrsets) recursiveUpdate;
in
rec {

# aho-corasick-0.6.10

  crates.aho_corasick."0.6.10" = deps: { features?(features_.aho_corasick."0.6.10" deps {}) }: buildRustCrate {
    crateName = "aho-corasick";
    version = "0.6.10";
    description = "Fast multiple substring searching with finite state machines.";
    authors = [ "Andrew Gallant <jamslam@gmail.com>" ];
    sha256 = "0bhasxfpmfmz1460chwsx59vdld05axvmk1nbp3sd48xav3d108p";
    libName = "aho_corasick";
    crateBin =
      [{  name = "aho-corasick-dot";  path = "src/main.rs"; }];
    dependencies = mapFeatures features ([
      (crates."memchr"."${deps."aho_corasick"."0.6.10"."memchr"}" deps)
    ]);
  };
  features_.aho_corasick."0.6.10" = deps: f: updateFeatures f (rec {
    aho_corasick."0.6.10".default = (f.aho_corasick."0.6.10".default or true);
    memchr."${deps.aho_corasick."0.6.10".memchr}".default = true;
  }) [
    (features_.memchr."${deps."aho_corasick"."0.6.10"."memchr"}" deps)
  ];


# end
# aho-corasick-0.7.3

  crates.aho_corasick."0.7.3" = deps: { features?(features_.aho_corasick."0.7.3" deps {}) }: buildRustCrate {
    crateName = "aho-corasick";
    version = "0.7.3";
    description = "Fast multiple substring searching.";
    authors = [ "Andrew Gallant <jamslam@gmail.com>" ];
    sha256 = "0dn42fbdms4brigqphxrvzbjd1s4knyjlzky30kgvpnrcl4sqqdv";
    libName = "aho_corasick";
    dependencies = mapFeatures features ([
      (crates."memchr"."${deps."aho_corasick"."0.7.3"."memchr"}" deps)
    ]);
    features = mkFeatures (features."aho_corasick"."0.7.3" or {});
  };
  features_.aho_corasick."0.7.3" = deps: f: updateFeatures f (rec {
    aho_corasick = fold recursiveUpdate {} [
      { "0.7.3"."std" =
        (f.aho_corasick."0.7.3"."std" or false) ||
        (f.aho_corasick."0.7.3".default or false) ||
        (aho_corasick."0.7.3"."default" or false); }
      { "0.7.3".default = (f.aho_corasick."0.7.3".default or true); }
    ];
    memchr = fold recursiveUpdate {} [
      { "${deps.aho_corasick."0.7.3".memchr}"."use_std" =
        (f.memchr."${deps.aho_corasick."0.7.3".memchr}"."use_std" or false) ||
        (aho_corasick."0.7.3"."std" or false) ||
        (f."aho_corasick"."0.7.3"."std" or false); }
      { "${deps.aho_corasick."0.7.3".memchr}".default = (f.memchr."${deps.aho_corasick."0.7.3".memchr}".default or false); }
    ];
  }) [
    (features_.memchr."${deps."aho_corasick"."0.7.3"."memchr"}" deps)
  ];


# end
# argon2rs-0.2.5

  crates.argon2rs."0.2.5" = deps: { features?(features_.argon2rs."0.2.5" deps {}) }: buildRustCrate {
    crateName = "argon2rs";
    version = "0.2.5";
    description = "The pure Rust password hashing library that runs on Argon2.";
    authors = [ "bryant <bryant@defrag.in>" ];
    sha256 = "1byl9b3wwyrarn8qack21v5fi2qsnn3y5clvikk2apskhmnih1rw";
    dependencies = mapFeatures features ([
      (crates."blake2_rfc"."${deps."argon2rs"."0.2.5"."blake2_rfc"}" deps)
      (crates."scoped_threadpool"."${deps."argon2rs"."0.2.5"."scoped_threadpool"}" deps)
    ]);
    features = mkFeatures (features."argon2rs"."0.2.5" or {});
  };
  features_.argon2rs."0.2.5" = deps: f: updateFeatures f (rec {
    argon2rs."0.2.5".default = (f.argon2rs."0.2.5".default or true);
    blake2_rfc = fold recursiveUpdate {} [
      { "${deps.argon2rs."0.2.5".blake2_rfc}"."simd_asm" =
        (f.blake2_rfc."${deps.argon2rs."0.2.5".blake2_rfc}"."simd_asm" or false) ||
        (argon2rs."0.2.5"."simd" or false) ||
        (f."argon2rs"."0.2.5"."simd" or false); }
      { "${deps.argon2rs."0.2.5".blake2_rfc}".default = true; }
    ];
    scoped_threadpool."${deps.argon2rs."0.2.5".scoped_threadpool}".default = true;
  }) [
    (features_.blake2_rfc."${deps."argon2rs"."0.2.5"."blake2_rfc"}" deps)
    (features_.scoped_threadpool."${deps."argon2rs"."0.2.5"."scoped_threadpool"}" deps)
  ];


# end
# arrayvec-0.4.10

  crates.arrayvec."0.4.10" = deps: { features?(features_.arrayvec."0.4.10" deps {}) }: buildRustCrate {
    crateName = "arrayvec";
    version = "0.4.10";
    description = "A vector with fixed capacity, backed by an array (it can be stored on the stack too). Implements fixed capacity ArrayVec and ArrayString.";
    authors = [ "bluss" ];
    sha256 = "0qbh825i59w5wfdysqdkiwbwkrsy7lgbd4pwbyb8pxx8wc36iny8";
    dependencies = mapFeatures features ([
      (crates."nodrop"."${deps."arrayvec"."0.4.10"."nodrop"}" deps)
    ]);
    features = mkFeatures (features."arrayvec"."0.4.10" or {});
  };
  features_.arrayvec."0.4.10" = deps: f: updateFeatures f (rec {
    arrayvec = fold recursiveUpdate {} [
      { "0.4.10"."serde" =
        (f.arrayvec."0.4.10"."serde" or false) ||
        (f.arrayvec."0.4.10".serde-1 or false) ||
        (arrayvec."0.4.10"."serde-1" or false); }
      { "0.4.10"."std" =
        (f.arrayvec."0.4.10"."std" or false) ||
        (f.arrayvec."0.4.10".default or false) ||
        (arrayvec."0.4.10"."default" or false); }
      { "0.4.10".default = (f.arrayvec."0.4.10".default or true); }
    ];
    nodrop."${deps.arrayvec."0.4.10".nodrop}".default = (f.nodrop."${deps.arrayvec."0.4.10".nodrop}".default or false);
  }) [
    (features_.nodrop."${deps."arrayvec"."0.4.10"."nodrop"}" deps)
  ];


# end
# autocfg-0.1.2

  crates.autocfg."0.1.2" = deps: { features?(features_.autocfg."0.1.2" deps {}) }: buildRustCrate {
    crateName = "autocfg";
    version = "0.1.2";
    description = "Automatic cfg for Rust compiler features";
    authors = [ "Josh Stone <cuviper@gmail.com>" ];
    sha256 = "0dv81dwnp1al3j4ffz007yrjv4w1c7hw09gnf0xs3icxiw6qqfs3";
  };
  features_.autocfg."0.1.2" = deps: f: updateFeatures f (rec {
    autocfg."0.1.2".default = (f.autocfg."0.1.2".default or true);
  }) [];


# end
# backtrace-0.3.15

  crates.backtrace."0.3.15" = deps: { features?(features_.backtrace."0.3.15" deps {}) }: buildRustCrate {
    crateName = "backtrace";
    version = "0.3.15";
    description = "A library to acquire a stack trace (backtrace) at runtime in a Rust program.\n";
    authors = [ "Alex Crichton <alex@alexcrichton.com>" "The Rust Project Developers" ];
    sha256 = "0qgbc07aq9kfixv29s60xx666lmdpgmf27a78fwjlhnfzhqvkn0p";
    dependencies = mapFeatures features ([
      (crates."cfg_if"."${deps."backtrace"."0.3.15"."cfg_if"}" deps)
      (crates."rustc_demangle"."${deps."backtrace"."0.3.15"."rustc_demangle"}" deps)
    ])
      ++ (if (kernel == "linux" || kernel == "darwin") && !(kernel == "fuchsia") && !(kernel == "emscripten") && !(kernel == "darwin") && !(kernel == "ios") then mapFeatures features ([
    ]
      ++ (if features.backtrace."0.3.15".backtrace-sys or false then [ (crates.backtrace_sys."${deps."backtrace"."0.3.15".backtrace_sys}" deps) ] else [])) else [])
      ++ (if (kernel == "linux" || kernel == "darwin") || abi == "sgx" then mapFeatures features ([
      (crates."libc"."${deps."backtrace"."0.3.15"."libc"}" deps)
    ]) else [])
      ++ (if kernel == "windows" then mapFeatures features ([
      (crates."winapi"."${deps."backtrace"."0.3.15"."winapi"}" deps)
    ]) else []);

    buildDependencies = mapFeatures features ([
      (crates."autocfg"."${deps."backtrace"."0.3.15"."autocfg"}" deps)
    ]);
    features = mkFeatures (features."backtrace"."0.3.15" or {});
  };
  features_.backtrace."0.3.15" = deps: f: updateFeatures f (rec {
    autocfg."${deps.backtrace."0.3.15".autocfg}".default = true;
    backtrace = fold recursiveUpdate {} [
      { "0.3.15"."addr2line" =
        (f.backtrace."0.3.15"."addr2line" or false) ||
        (f.backtrace."0.3.15".gimli-symbolize or false) ||
        (backtrace."0.3.15"."gimli-symbolize" or false); }
      { "0.3.15"."backtrace-sys" =
        (f.backtrace."0.3.15"."backtrace-sys" or false) ||
        (f.backtrace."0.3.15".libbacktrace or false) ||
        (backtrace."0.3.15"."libbacktrace" or false); }
      { "0.3.15"."coresymbolication" =
        (f.backtrace."0.3.15"."coresymbolication" or false) ||
        (f.backtrace."0.3.15".default or false) ||
        (backtrace."0.3.15"."default" or false); }
      { "0.3.15"."dbghelp" =
        (f.backtrace."0.3.15"."dbghelp" or false) ||
        (f.backtrace."0.3.15".default or false) ||
        (backtrace."0.3.15"."default" or false); }
      { "0.3.15"."dladdr" =
        (f.backtrace."0.3.15"."dladdr" or false) ||
        (f.backtrace."0.3.15".default or false) ||
        (backtrace."0.3.15"."default" or false); }
      { "0.3.15"."findshlibs" =
        (f.backtrace."0.3.15"."findshlibs" or false) ||
        (f.backtrace."0.3.15".gimli-symbolize or false) ||
        (backtrace."0.3.15"."gimli-symbolize" or false); }
      { "0.3.15"."gimli" =
        (f.backtrace."0.3.15"."gimli" or false) ||
        (f.backtrace."0.3.15".gimli-symbolize or false) ||
        (backtrace."0.3.15"."gimli-symbolize" or false); }
      { "0.3.15"."libbacktrace" =
        (f.backtrace."0.3.15"."libbacktrace" or false) ||
        (f.backtrace."0.3.15".default or false) ||
        (backtrace."0.3.15"."default" or false); }
      { "0.3.15"."libunwind" =
        (f.backtrace."0.3.15"."libunwind" or false) ||
        (f.backtrace."0.3.15".default or false) ||
        (backtrace."0.3.15"."default" or false); }
      { "0.3.15"."memmap" =
        (f.backtrace."0.3.15"."memmap" or false) ||
        (f.backtrace."0.3.15".gimli-symbolize or false) ||
        (backtrace."0.3.15"."gimli-symbolize" or false); }
      { "0.3.15"."object" =
        (f.backtrace."0.3.15"."object" or false) ||
        (f.backtrace."0.3.15".gimli-symbolize or false) ||
        (backtrace."0.3.15"."gimli-symbolize" or false); }
      { "0.3.15"."rustc-serialize" =
        (f.backtrace."0.3.15"."rustc-serialize" or false) ||
        (f.backtrace."0.3.15".serialize-rustc or false) ||
        (backtrace."0.3.15"."serialize-rustc" or false); }
      { "0.3.15"."serde" =
        (f.backtrace."0.3.15"."serde" or false) ||
        (f.backtrace."0.3.15".serialize-serde or false) ||
        (backtrace."0.3.15"."serialize-serde" or false); }
      { "0.3.15"."serde_derive" =
        (f.backtrace."0.3.15"."serde_derive" or false) ||
        (f.backtrace."0.3.15".serialize-serde or false) ||
        (backtrace."0.3.15"."serialize-serde" or false); }
      { "0.3.15"."std" =
        (f.backtrace."0.3.15"."std" or false) ||
        (f.backtrace."0.3.15".default or false) ||
        (backtrace."0.3.15"."default" or false) ||
        (f.backtrace."0.3.15".libbacktrace or false) ||
        (backtrace."0.3.15"."libbacktrace" or false); }
      { "0.3.15".default = (f.backtrace."0.3.15".default or true); }
    ];
    backtrace_sys."${deps.backtrace."0.3.15".backtrace_sys}".default = true;
    cfg_if."${deps.backtrace."0.3.15".cfg_if}".default = true;
    libc."${deps.backtrace."0.3.15".libc}".default = (f.libc."${deps.backtrace."0.3.15".libc}".default or false);
    rustc_demangle."${deps.backtrace."0.3.15".rustc_demangle}".default = true;
    winapi = fold recursiveUpdate {} [
      { "${deps.backtrace."0.3.15".winapi}"."dbghelp" = true; }
      { "${deps.backtrace."0.3.15".winapi}"."minwindef" = true; }
      { "${deps.backtrace."0.3.15".winapi}"."processthreadsapi" = true; }
      { "${deps.backtrace."0.3.15".winapi}"."winnt" = true; }
      { "${deps.backtrace."0.3.15".winapi}".default = true; }
    ];
  }) [
    (features_.cfg_if."${deps."backtrace"."0.3.15"."cfg_if"}" deps)
    (features_.rustc_demangle."${deps."backtrace"."0.3.15"."rustc_demangle"}" deps)
    (features_.autocfg."${deps."backtrace"."0.3.15"."autocfg"}" deps)
    (features_.backtrace_sys."${deps."backtrace"."0.3.15"."backtrace_sys"}" deps)
    (features_.libc."${deps."backtrace"."0.3.15"."libc"}" deps)
    (features_.winapi."${deps."backtrace"."0.3.15"."winapi"}" deps)
  ];


# end
# backtrace-sys-0.1.28

  crates.backtrace_sys."0.1.28" = deps: { features?(features_.backtrace_sys."0.1.28" deps {}) }: buildRustCrate {
    crateName = "backtrace-sys";
    version = "0.1.28";
    description = "Bindings to the libbacktrace gcc library\n";
    authors = [ "Alex Crichton <alex@alexcrichton.com>" ];
    sha256 = "1bbw8chs0wskxwzz7f3yy7mjqhyqj8lslq8pcjw1rbd2g23c34xl";
    build = "build.rs";
    dependencies = mapFeatures features ([
      (crates."libc"."${deps."backtrace_sys"."0.1.28"."libc"}" deps)
    ]);

    buildDependencies = mapFeatures features ([
      (crates."cc"."${deps."backtrace_sys"."0.1.28"."cc"}" deps)
    ]);
  };
  features_.backtrace_sys."0.1.28" = deps: f: updateFeatures f (rec {
    backtrace_sys."0.1.28".default = (f.backtrace_sys."0.1.28".default or true);
    cc."${deps.backtrace_sys."0.1.28".cc}".default = true;
    libc."${deps.backtrace_sys."0.1.28".libc}".default = (f.libc."${deps.backtrace_sys."0.1.28".libc}".default or false);
  }) [
    (features_.libc."${deps."backtrace_sys"."0.1.28"."libc"}" deps)
    (features_.cc."${deps."backtrace_sys"."0.1.28"."cc"}" deps)
  ];


# end
# bit-set-0.4.0

  crates.bit_set."0.4.0" = deps: { features?(features_.bit_set."0.4.0" deps {}) }: buildRustCrate {
    crateName = "bit-set";
    version = "0.4.0";
    description = "A set of bits";
    authors = [ "Alexis Beingessner <a.beingessner@gmail.com>" ];
    sha256 = "1vqf0n4hmy1gnzsbb8kc3a2p62smldgywdf8kf0q0r2sfblw3gvz";
    dependencies = mapFeatures features ([
      (crates."bit_vec"."${deps."bit_set"."0.4.0"."bit_vec"}" deps)
    ]);
    features = mkFeatures (features."bit_set"."0.4.0" or {});
  };
  features_.bit_set."0.4.0" = deps: f: updateFeatures f (rec {
    bit_set."0.4.0".default = (f.bit_set."0.4.0".default or true);
    bit_vec."${deps.bit_set."0.4.0".bit_vec}".default = true;
  }) [
    (features_.bit_vec."${deps."bit_set"."0.4.0"."bit_vec"}" deps)
  ];


# end
# bit-vec-0.4.4

  crates.bit_vec."0.4.4" = deps: { features?(features_.bit_vec."0.4.4" deps {}) }: buildRustCrate {
    crateName = "bit-vec";
    version = "0.4.4";
    description = "A vector of bits";
    authors = [ "Alexis Beingessner <a.beingessner@gmail.com>" ];
    sha256 = "06czykmn001z6c3a4nsrpc3lrj63ga0kzp7kgva9r9wylhkkqpq9";
    features = mkFeatures (features."bit_vec"."0.4.4" or {});
  };
  features_.bit_vec."0.4.4" = deps: f: updateFeatures f (rec {
    bit_vec."0.4.4".default = (f.bit_vec."0.4.4".default or true);
  }) [];


# end
# bitflags-1.0.4

  crates.bitflags."1.0.4" = deps: { features?(features_.bitflags."1.0.4" deps {}) }: buildRustCrate {
    crateName = "bitflags";
    version = "1.0.4";
    description = "A macro to generate structures which behave like bitflags.\n";
    authors = [ "The Rust Project Developers" ];
    sha256 = "1g1wmz2001qmfrd37dnd5qiss5njrw26aywmg6yhkmkbyrhjxb08";
    features = mkFeatures (features."bitflags"."1.0.4" or {});
  };
  features_.bitflags."1.0.4" = deps: f: updateFeatures f (rec {
    bitflags."1.0.4".default = (f.bitflags."1.0.4".default or true);
  }) [];


# end
# blake2-rfc-0.2.18

  crates.blake2_rfc."0.2.18" = deps: { features?(features_.blake2_rfc."0.2.18" deps {}) }: buildRustCrate {
    crateName = "blake2-rfc";
    version = "0.2.18";
    description = "A pure Rust implementation of BLAKE2 based on RFC 7693.";
    authors = [ "Cesar Eduardo Barros <cesarb@cesarb.eti.br>" ];
    sha256 = "0pyqrik4471ljk16prs0iwb2sam39z0z6axyyjxlqxdmf4wprf0l";
    dependencies = mapFeatures features ([
      (crates."arrayvec"."${deps."blake2_rfc"."0.2.18"."arrayvec"}" deps)
      (crates."constant_time_eq"."${deps."blake2_rfc"."0.2.18"."constant_time_eq"}" deps)
    ]);
    features = mkFeatures (features."blake2_rfc"."0.2.18" or {});
  };
  features_.blake2_rfc."0.2.18" = deps: f: updateFeatures f (rec {
    arrayvec."${deps.blake2_rfc."0.2.18".arrayvec}".default = (f.arrayvec."${deps.blake2_rfc."0.2.18".arrayvec}".default or false);
    blake2_rfc = fold recursiveUpdate {} [
      { "0.2.18"."simd" =
        (f.blake2_rfc."0.2.18"."simd" or false) ||
        (f.blake2_rfc."0.2.18".simd_opt or false) ||
        (blake2_rfc."0.2.18"."simd_opt" or false); }
      { "0.2.18"."simd_opt" =
        (f.blake2_rfc."0.2.18"."simd_opt" or false) ||
        (f.blake2_rfc."0.2.18".simd_asm or false) ||
        (blake2_rfc."0.2.18"."simd_asm" or false); }
      { "0.2.18"."std" =
        (f.blake2_rfc."0.2.18"."std" or false) ||
        (f.blake2_rfc."0.2.18".default or false) ||
        (blake2_rfc."0.2.18"."default" or false); }
      { "0.2.18".default = (f.blake2_rfc."0.2.18".default or true); }
    ];
    constant_time_eq."${deps.blake2_rfc."0.2.18".constant_time_eq}".default = true;
  }) [
    (features_.arrayvec."${deps."blake2_rfc"."0.2.18"."arrayvec"}" deps)
    (features_.constant_time_eq."${deps."blake2_rfc"."0.2.18"."constant_time_eq"}" deps)
  ];


# end
# block-0.1.6

  crates.block."0.1.6" = deps: { features?(features_.block."0.1.6" deps {}) }: buildRustCrate {
    crateName = "block";
    version = "0.1.6";
    description = "Rust interface for Apple's C language extension of blocks.";
    authors = [ "Steven Sheldon" ];
    sha256 = "1hwfh5992ya0dsbn1ldrlbbdi2a8fqmnvdnla5rdbnd4g2bsc6q5";
  };
  features_.block."0.1.6" = deps: f: updateFeatures f (rec {
    block."0.1.6".default = (f.block."0.1.6".default or true);
  }) [];


# end
# byteorder-1.3.1

  crates.byteorder."1.3.1" = deps: { features?(features_.byteorder."1.3.1" deps {}) }: buildRustCrate {
    crateName = "byteorder";
    version = "1.3.1";
    description = "Library for reading/writing numbers in big-endian and little-endian.";
    authors = [ "Andrew Gallant <jamslam@gmail.com>" ];
    sha256 = "1dd46l7fvmxfq90kh6ip1ghsxzzcdybac8f0mh2jivsdv9vy8k4w";
    build = "build.rs";
    features = mkFeatures (features."byteorder"."1.3.1" or {});
  };
  features_.byteorder."1.3.1" = deps: f: updateFeatures f (rec {
    byteorder = fold recursiveUpdate {} [
      { "1.3.1"."std" =
        (f.byteorder."1.3.1"."std" or false) ||
        (f.byteorder."1.3.1".default or false) ||
        (byteorder."1.3.1"."default" or false); }
      { "1.3.1".default = (f.byteorder."1.3.1".default or true); }
    ];
  }) [];


# end
# cc-1.0.34

  crates.cc."1.0.34" = deps: { features?(features_.cc."1.0.34" deps {}) }: buildRustCrate {
    crateName = "cc";
    version = "1.0.34";
    description = "A build-time dependency for Cargo build scripts to assist in invoking the native\nC compiler to compile native C code into a static archive to be linked into Rust\ncode.\n";
    authors = [ "Alex Crichton <alex@alexcrichton.com>" ];
    sha256 = "1affrbaz4hpr0krymk343vlpzb6i5dy7ml19mvs0101yr8qq1jni";
    dependencies = mapFeatures features ([
]);
    features = mkFeatures (features."cc"."1.0.34" or {});
  };
  features_.cc."1.0.34" = deps: f: updateFeatures f (rec {
    cc = fold recursiveUpdate {} [
      { "1.0.34"."rayon" =
        (f.cc."1.0.34"."rayon" or false) ||
        (f.cc."1.0.34".parallel or false) ||
        (cc."1.0.34"."parallel" or false); }
      { "1.0.34".default = (f.cc."1.0.34".default or true); }
    ];
  }) [];


# end
# cfg-if-0.1.7

  crates.cfg_if."0.1.7" = deps: { features?(features_.cfg_if."0.1.7" deps {}) }: buildRustCrate {
    crateName = "cfg-if";
    version = "0.1.7";
    description = "A macro to ergonomically define an item depending on a large number of #[cfg]\nparameters. Structured like an if-else chain, the first matching branch is the\nitem that gets emitted.\n";
    authors = [ "Alex Crichton <alex@alexcrichton.com>" ];
    sha256 = "13gvcx1dxjq4mpmpj26hpg3yc97qffkx2zi58ykr1dwr8q2biiig";
  };
  features_.cfg_if."0.1.7" = deps: f: updateFeatures f (rec {
    cfg_if."0.1.7".default = (f.cfg_if."0.1.7".default or true);
  }) [];


# end
# clipboard-0.5.0

  crates.clipboard."0.5.0" = deps: { features?(features_.clipboard."0.5.0" deps {}) }: buildRustCrate {
    crateName = "clipboard";
    version = "0.5.0";
    description = "rust-clipboard is a cross-platform library for getting and setting the contents of the OS-level clipboard.";
    authors = [ "Avi Weinstock <aweinstock314@gmail.com>" ];
    sha256 = "1vmwqycg8f7ahwci6kcxslccac3bcsp2k08v4l5c6h2vzzh4a77x";
    dependencies = (if (kernel == "linux" || kernel == "darwin") && !(kernel == "darwin" || kernel == "android") then mapFeatures features ([
      (crates."x11_clipboard"."${deps."clipboard"."0.5.0"."x11_clipboard"}" deps)
    ]) else [])
      ++ (if kernel == "darwin" then mapFeatures features ([
      (crates."objc"."${deps."clipboard"."0.5.0"."objc"}" deps)
      (crates."objc_foundation"."${deps."clipboard"."0.5.0"."objc_foundation"}" deps)
      (crates."objc_id"."${deps."clipboard"."0.5.0"."objc_id"}" deps)
    ]) else [])
      ++ (if kernel == "windows" then mapFeatures features ([
      (crates."clipboard_win"."${deps."clipboard"."0.5.0"."clipboard_win"}" deps)
    ]) else []);
  };
  features_.clipboard."0.5.0" = deps: f: updateFeatures f (rec {
    clipboard."0.5.0".default = (f.clipboard."0.5.0".default or true);
    clipboard_win."${deps.clipboard."0.5.0".clipboard_win}".default = true;
    objc."${deps.clipboard."0.5.0".objc}".default = true;
    objc_foundation."${deps.clipboard."0.5.0".objc_foundation}".default = true;
    objc_id."${deps.clipboard."0.5.0".objc_id}".default = true;
    x11_clipboard."${deps.clipboard."0.5.0".x11_clipboard}".default = true;
  }) [
    (features_.x11_clipboard."${deps."clipboard"."0.5.0"."x11_clipboard"}" deps)
    (features_.objc."${deps."clipboard"."0.5.0"."objc"}" deps)
    (features_.objc_foundation."${deps."clipboard"."0.5.0"."objc_foundation"}" deps)
    (features_.objc_id."${deps."clipboard"."0.5.0"."objc_id"}" deps)
    (features_.clipboard_win."${deps."clipboard"."0.5.0"."clipboard_win"}" deps)
  ];


# end
# clipboard-win-2.1.2

  crates.clipboard_win."2.1.2" = deps: { features?(features_.clipboard_win."2.1.2" deps {}) }: buildRustCrate {
    crateName = "clipboard-win";
    version = "2.1.2";
    description = "Provides simple way to interact with Windows clipboard.";
    authors = [ "Douman <douman@gmx.se>" ];
    sha256 = "0y9dkh97rr1yyca0sny7gisgg1x19a4bf9m0hkzg9wpc88rfsw67";
    libPath = "src/lib.rs";
    libName = "clipboard_win";
    dependencies = (if kernel == "windows" then mapFeatures features ([
      (crates."winapi"."${deps."clipboard_win"."2.1.2"."winapi"}" deps)
    ]) else []);
    features = mkFeatures (features."clipboard_win"."2.1.2" or {});
  };
  features_.clipboard_win."2.1.2" = deps: f: updateFeatures f (rec {
    clipboard_win."2.1.2".default = (f.clipboard_win."2.1.2".default or true);
    winapi = fold recursiveUpdate {} [
      { "${deps.clipboard_win."2.1.2".winapi}"."basetsd" = true; }
      { "${deps.clipboard_win."2.1.2".winapi}"."winbase" = true; }
      { "${deps.clipboard_win."2.1.2".winapi}"."winuser" = true; }
      { "${deps.clipboard_win."2.1.2".winapi}".default = (f.winapi."${deps.clipboard_win."2.1.2".winapi}".default or false); }
    ];
  }) [
    (features_.winapi."${deps."clipboard_win"."2.1.2"."winapi"}" deps)
  ];


# end
# cloudabi-0.0.3

  crates.cloudabi."0.0.3" = deps: { features?(features_.cloudabi."0.0.3" deps {}) }: buildRustCrate {
    crateName = "cloudabi";
    version = "0.0.3";
    description = "Low level interface to CloudABI. Contains all syscalls and related types.";
    authors = [ "Nuxi (https://nuxi.nl/) and contributors" ];
    sha256 = "1z9lby5sr6vslfd14d6igk03s7awf91mxpsfmsp3prxbxlk0x7h5";
    libPath = "cloudabi.rs";
    dependencies = mapFeatures features ([
    ]
      ++ (if features.cloudabi."0.0.3".bitflags or false then [ (crates.bitflags."${deps."cloudabi"."0.0.3".bitflags}" deps) ] else []));
    features = mkFeatures (features."cloudabi"."0.0.3" or {});
  };
  features_.cloudabi."0.0.3" = deps: f: updateFeatures f (rec {
    bitflags."${deps.cloudabi."0.0.3".bitflags}".default = true;
    cloudabi = fold recursiveUpdate {} [
      { "0.0.3"."bitflags" =
        (f.cloudabi."0.0.3"."bitflags" or false) ||
        (f.cloudabi."0.0.3".default or false) ||
        (cloudabi."0.0.3"."default" or false); }
      { "0.0.3".default = (f.cloudabi."0.0.3".default or true); }
    ];
  }) [
    (features_.bitflags."${deps."cloudabi"."0.0.3"."bitflags"}" deps)
  ];


# end
# constant_time_eq-0.1.3

  crates.constant_time_eq."0.1.3" = deps: { features?(features_.constant_time_eq."0.1.3" deps {}) }: buildRustCrate {
    crateName = "constant_time_eq";
    version = "0.1.3";
    description = "Compares two equal-sized byte strings in constant time.";
    authors = [ "Cesar Eduardo Barros <cesarb@cesarb.eti.br>" ];
    sha256 = "03qri9hjf049gwqg9q527lybpg918q6y5q4g9a5lma753nff49wd";
  };
  features_.constant_time_eq."0.1.3" = deps: f: updateFeatures f (rec {
    constant_time_eq."0.1.3".default = (f.constant_time_eq."0.1.3".default or true);
  }) [];


# end
# derive_builder-0.5.1

  crates.derive_builder."0.5.1" = deps: { features?(features_.derive_builder."0.5.1" deps {}) }: buildRustCrate {
    crateName = "derive_builder";
    version = "0.5.1";
    description = "Rust macro to automatically implement the builder pattern for arbitrary structs.";
    authors = [ "Colin Kiegel <kiegel@gmx.de>" "Pascal Hertleif <killercup@gmail.com>" "Jan-Erik Rediger <janerik@fnordig.de>" "Ted Driggs <ted.driggs@outlook.com>" ];
    sha256 = "0w4k4k5g4lfrhzzzqxi9zp4x8m889kg0z36wvbxi9xxgcfy3az8n";
    procMacro = true;
    build = "build/mod.rs";
    dependencies = mapFeatures features ([
      (crates."derive_builder_core"."${deps."derive_builder"."0.5.1"."derive_builder_core"}" deps)
      (crates."quote"."${deps."derive_builder"."0.5.1"."quote"}" deps)
      (crates."syn"."${deps."derive_builder"."0.5.1"."syn"}" deps)
    ]);

    buildDependencies = mapFeatures features ([
]);
    features = mkFeatures (features."derive_builder"."0.5.1" or {});
  };
  features_.derive_builder."0.5.1" = deps: f: updateFeatures f (rec {
    derive_builder = fold recursiveUpdate {} [
      { "0.5.1"."compiletest_rs" =
        (f.derive_builder."0.5.1"."compiletest_rs" or false) ||
        (f.derive_builder."0.5.1".nightlytests or false) ||
        (derive_builder."0.5.1"."nightlytests" or false); }
      { "0.5.1"."env_logger" =
        (f.derive_builder."0.5.1"."env_logger" or false) ||
        (f.derive_builder."0.5.1".logging or false) ||
        (derive_builder."0.5.1"."logging" or false); }
      { "0.5.1"."log" =
        (f.derive_builder."0.5.1"."log" or false) ||
        (f.derive_builder."0.5.1".logging or false) ||
        (derive_builder."0.5.1"."logging" or false); }
      { "0.5.1"."skeptic" =
        (f.derive_builder."0.5.1"."skeptic" or false) ||
        (f.derive_builder."0.5.1".skeptic_tests or false) ||
        (derive_builder."0.5.1"."skeptic_tests" or false); }
      { "0.5.1".default = (f.derive_builder."0.5.1".default or true); }
    ];
    derive_builder_core = fold recursiveUpdate {} [
      { "${deps.derive_builder."0.5.1".derive_builder_core}"."logging" =
        (f.derive_builder_core."${deps.derive_builder."0.5.1".derive_builder_core}"."logging" or false) ||
        (derive_builder."0.5.1"."logging" or false) ||
        (f."derive_builder"."0.5.1"."logging" or false); }
      { "${deps.derive_builder."0.5.1".derive_builder_core}".default = true; }
    ];
    quote."${deps.derive_builder."0.5.1".quote}".default = true;
    syn."${deps.derive_builder."0.5.1".syn}".default = true;
  }) [
    (features_.derive_builder_core."${deps."derive_builder"."0.5.1"."derive_builder_core"}" deps)
    (features_.quote."${deps."derive_builder"."0.5.1"."quote"}" deps)
    (features_.syn."${deps."derive_builder"."0.5.1"."syn"}" deps)
  ];


# end
# derive_builder_core-0.2.0

  crates.derive_builder_core."0.2.0" = deps: { features?(features_.derive_builder_core."0.2.0" deps {}) }: buildRustCrate {
    crateName = "derive_builder_core";
    version = "0.2.0";
    description = "Internal helper library for the derive_builder crate.";
    authors = [ "Colin Kiegel <kiegel@gmx.de>" "Pascal Hertleif <killercup@gmail.com>" "Jan-Erik Rediger <janerik@fnordig.de>" "Ted Driggs <ted.driggs@outlook.com>" ];
    sha256 = "14kggzaggy6ra7q88cilyriy3ji4bin5favq6qd1z9vl9nvafgs9";
    dependencies = mapFeatures features ([
      (crates."quote"."${deps."derive_builder_core"."0.2.0"."quote"}" deps)
      (crates."syn"."${deps."derive_builder_core"."0.2.0"."syn"}" deps)
    ]);
    features = mkFeatures (features."derive_builder_core"."0.2.0" or {});
  };
  features_.derive_builder_core."0.2.0" = deps: f: updateFeatures f (rec {
    derive_builder_core = fold recursiveUpdate {} [
      { "0.2.0"."log" =
        (f.derive_builder_core."0.2.0"."log" or false) ||
        (f.derive_builder_core."0.2.0".logging or false) ||
        (derive_builder_core."0.2.0"."logging" or false); }
      { "0.2.0".default = (f.derive_builder_core."0.2.0".default or true); }
    ];
    quote."${deps.derive_builder_core."0.2.0".quote}".default = true;
    syn."${deps.derive_builder_core."0.2.0".syn}".default = true;
  }) [
    (features_.quote."${deps."derive_builder_core"."0.2.0"."quote"}" deps)
    (features_.syn."${deps."derive_builder_core"."0.2.0"."syn"}" deps)
  ];


# end
# dirs-1.0.5

  crates.dirs."1.0.5" = deps: { features?(features_.dirs."1.0.5" deps {}) }: buildRustCrate {
    crateName = "dirs";
    version = "1.0.5";
    description = "A tiny low-level library that provides platform-specific standard locations of directories for config, cache and other data on Linux, Windows, macOS and Redox by leveraging the mechanisms defined by the XDG base/user directory specifications on Linux, the Known Folder API on Windows, and the Standard Directory guidelines on macOS.";
    authors = [ "Simon Ochsenreither <simon@ochsenreither.de>" ];
    sha256 = "1py68zwwrhlj5vbz9f9ansjmhc8y4gs5bpamw9ycmqz030pprwf3";
    dependencies = (if kernel == "redox" then mapFeatures features ([
      (crates."redox_users"."${deps."dirs"."1.0.5"."redox_users"}" deps)
    ]) else [])
      ++ (if (kernel == "linux" || kernel == "darwin") then mapFeatures features ([
      (crates."libc"."${deps."dirs"."1.0.5"."libc"}" deps)
    ]) else [])
      ++ (if kernel == "windows" then mapFeatures features ([
      (crates."winapi"."${deps."dirs"."1.0.5"."winapi"}" deps)
    ]) else []);
  };
  features_.dirs."1.0.5" = deps: f: updateFeatures f (rec {
    dirs."1.0.5".default = (f.dirs."1.0.5".default or true);
    libc."${deps.dirs."1.0.5".libc}".default = true;
    redox_users."${deps.dirs."1.0.5".redox_users}".default = true;
    winapi = fold recursiveUpdate {} [
      { "${deps.dirs."1.0.5".winapi}"."knownfolders" = true; }
      { "${deps.dirs."1.0.5".winapi}"."objbase" = true; }
      { "${deps.dirs."1.0.5".winapi}"."shlobj" = true; }
      { "${deps.dirs."1.0.5".winapi}"."winbase" = true; }
      { "${deps.dirs."1.0.5".winapi}"."winerror" = true; }
      { "${deps.dirs."1.0.5".winapi}".default = true; }
    ];
  }) [
    (features_.redox_users."${deps."dirs"."1.0.5"."redox_users"}" deps)
    (features_.libc."${deps."dirs"."1.0.5"."libc"}" deps)
    (features_.winapi."${deps."dirs"."1.0.5"."winapi"}" deps)
  ];


# end
# either-1.5.2

  crates.either."1.5.2" = deps: { features?(features_.either."1.5.2" deps {}) }: buildRustCrate {
    crateName = "either";
    version = "1.5.2";
    description = "The enum `Either` with variants `Left` and `Right` is a general purpose sum type with two cases.\n";
    authors = [ "bluss" ];
    sha256 = "1zqq1057c51f53ga4p9l4dd8ax6md27h1xjrjp2plkvml5iymks5";
    dependencies = mapFeatures features ([
]);
    features = mkFeatures (features."either"."1.5.2" or {});
  };
  features_.either."1.5.2" = deps: f: updateFeatures f (rec {
    either = fold recursiveUpdate {} [
      { "1.5.2"."use_std" =
        (f.either."1.5.2"."use_std" or false) ||
        (f.either."1.5.2".default or false) ||
        (either."1.5.2"."default" or false); }
      { "1.5.2".default = (f.either."1.5.2".default or true); }
    ];
  }) [];


# end
# failure-0.1.5

  crates.failure."0.1.5" = deps: { features?(features_.failure."0.1.5" deps {}) }: buildRustCrate {
    crateName = "failure";
    version = "0.1.5";
    description = "Experimental error handling abstraction.";
    authors = [ "Without Boats <boats@mozilla.com>" ];
    sha256 = "1msaj1c0fg12dzyf4fhxqlx1gfx41lj2smdjmkc9hkrgajk2g3kx";
    dependencies = mapFeatures features ([
    ]
      ++ (if features.failure."0.1.5".backtrace or false then [ (crates.backtrace."${deps."failure"."0.1.5".backtrace}" deps) ] else [])
      ++ (if features.failure."0.1.5".failure_derive or false then [ (crates.failure_derive."${deps."failure"."0.1.5".failure_derive}" deps) ] else []));
    features = mkFeatures (features."failure"."0.1.5" or {});
  };
  features_.failure."0.1.5" = deps: f: updateFeatures f (rec {
    backtrace."${deps.failure."0.1.5".backtrace}".default = true;
    failure = fold recursiveUpdate {} [
      { "0.1.5"."backtrace" =
        (f.failure."0.1.5"."backtrace" or false) ||
        (f.failure."0.1.5".std or false) ||
        (failure."0.1.5"."std" or false); }
      { "0.1.5"."derive" =
        (f.failure."0.1.5"."derive" or false) ||
        (f.failure."0.1.5".default or false) ||
        (failure."0.1.5"."default" or false); }
      { "0.1.5"."failure_derive" =
        (f.failure."0.1.5"."failure_derive" or false) ||
        (f.failure."0.1.5".derive or false) ||
        (failure."0.1.5"."derive" or false); }
      { "0.1.5"."std" =
        (f.failure."0.1.5"."std" or false) ||
        (f.failure."0.1.5".default or false) ||
        (failure."0.1.5"."default" or false); }
      { "0.1.5".default = (f.failure."0.1.5".default or true); }
    ];
    failure_derive."${deps.failure."0.1.5".failure_derive}".default = true;
  }) [
    (features_.backtrace."${deps."failure"."0.1.5"."backtrace"}" deps)
    (features_.failure_derive."${deps."failure"."0.1.5"."failure_derive"}" deps)
  ];


# end
# failure_derive-0.1.5

  crates.failure_derive."0.1.5" = deps: { features?(features_.failure_derive."0.1.5" deps {}) }: buildRustCrate {
    crateName = "failure_derive";
    version = "0.1.5";
    description = "derives for the failure crate";
    authors = [ "Without Boats <woboats@gmail.com>" ];
    sha256 = "1wzk484b87r4qszcvdl2bkniv5ls4r2f2dshz7hmgiv6z4ln12g0";
    procMacro = true;
    build = "build.rs";
    dependencies = mapFeatures features ([
      (crates."proc_macro2"."${deps."failure_derive"."0.1.5"."proc_macro2"}" deps)
      (crates."quote"."${deps."failure_derive"."0.1.5"."quote"}" deps)
      (crates."syn"."${deps."failure_derive"."0.1.5"."syn"}" deps)
      (crates."synstructure"."${deps."failure_derive"."0.1.5"."synstructure"}" deps)
    ]);
    features = mkFeatures (features."failure_derive"."0.1.5" or {});
  };
  features_.failure_derive."0.1.5" = deps: f: updateFeatures f (rec {
    failure_derive."0.1.5".default = (f.failure_derive."0.1.5".default or true);
    proc_macro2."${deps.failure_derive."0.1.5".proc_macro2}".default = true;
    quote."${deps.failure_derive."0.1.5".quote}".default = true;
    syn."${deps.failure_derive."0.1.5".syn}".default = true;
    synstructure."${deps.failure_derive."0.1.5".synstructure}".default = true;
  }) [
    (features_.proc_macro2."${deps."failure_derive"."0.1.5"."proc_macro2"}" deps)
    (features_.quote."${deps."failure_derive"."0.1.5"."quote"}" deps)
    (features_.syn."${deps."failure_derive"."0.1.5"."syn"}" deps)
    (features_.synstructure."${deps."failure_derive"."0.1.5"."synstructure"}" deps)
  ];


# end
# fancy-regex-0.1.0

  crates.fancy_regex."0.1.0" = deps: { features?(features_.fancy_regex."0.1.0" deps {}) }: buildRustCrate {
    crateName = "fancy-regex";
    version = "0.1.0";
    description = "An implementation of regexes, supporting a relatively rich set of features, including backreferences and look-around.";
    authors = [ "Raph Levien <raph@google.com>" ];
    sha256 = "0ncnvj102q56qdszgdrax33lv1lp5a2zs0zi0hq1yzrch3aavpv4";
    dependencies = mapFeatures features ([
      (crates."bit_set"."${deps."fancy_regex"."0.1.0"."bit_set"}" deps)
      (crates."lazy_static"."${deps."fancy_regex"."0.1.0"."lazy_static"}" deps)
      (crates."memchr"."${deps."fancy_regex"."0.1.0"."memchr"}" deps)
      (crates."regex"."${deps."fancy_regex"."0.1.0"."regex"}" deps)
    ]);
  };
  features_.fancy_regex."0.1.0" = deps: f: updateFeatures f (rec {
    bit_set."${deps.fancy_regex."0.1.0".bit_set}".default = true;
    fancy_regex."0.1.0".default = (f.fancy_regex."0.1.0".default or true);
    lazy_static."${deps.fancy_regex."0.1.0".lazy_static}".default = true;
    memchr."${deps.fancy_regex."0.1.0".memchr}".default = true;
    regex."${deps.fancy_regex."0.1.0".regex}".default = true;
  }) [
    (features_.bit_set."${deps."fancy_regex"."0.1.0"."bit_set"}" deps)
    (features_.lazy_static."${deps."fancy_regex"."0.1.0"."lazy_static"}" deps)
    (features_.memchr."${deps."fancy_regex"."0.1.0"."memchr"}" deps)
    (features_.regex."${deps."fancy_regex"."0.1.0"."regex"}" deps)
  ];


# end
# foreign-types-0.3.2

  crates.foreign_types."0.3.2" = deps: { features?(features_.foreign_types."0.3.2" deps {}) }: buildRustCrate {
    crateName = "foreign-types";
    version = "0.3.2";
    description = "A framework for Rust wrappers over C APIs";
    authors = [ "Steven Fackler <sfackler@gmail.com>" ];
    sha256 = "105n8sp2djb1s5lzrw04p7ss3dchr5qa3canmynx396nh3vwm2p8";
    dependencies = mapFeatures features ([
      (crates."foreign_types_shared"."${deps."foreign_types"."0.3.2"."foreign_types_shared"}" deps)
    ]);
  };
  features_.foreign_types."0.3.2" = deps: f: updateFeatures f (rec {
    foreign_types."0.3.2".default = (f.foreign_types."0.3.2".default or true);
    foreign_types_shared."${deps.foreign_types."0.3.2".foreign_types_shared}".default = true;
  }) [
    (features_.foreign_types_shared."${deps."foreign_types"."0.3.2"."foreign_types_shared"}" deps)
  ];


# end
# foreign-types-shared-0.1.1

  crates.foreign_types_shared."0.1.1" = deps: { features?(features_.foreign_types_shared."0.1.1" deps {}) }: buildRustCrate {
    crateName = "foreign-types-shared";
    version = "0.1.1";
    description = "An internal crate used by foreign-types";
    authors = [ "Steven Fackler <sfackler@gmail.com>" ];
    sha256 = "0b6cnvqbflws8dxywk4589vgbz80049lz4x1g9dfy4s1ppd3g4z5";
  };
  features_.foreign_types_shared."0.1.1" = deps: f: updateFeatures f (rec {
    foreign_types_shared."0.1.1".default = (f.foreign_types_shared."0.1.1".default or true);
  }) [];


# end
# fuchsia-cprng-0.1.1

  crates.fuchsia_cprng."0.1.1" = deps: { features?(features_.fuchsia_cprng."0.1.1" deps {}) }: buildRustCrate {
    crateName = "fuchsia-cprng";
    version = "0.1.1";
    description = "Rust crate for the Fuchsia cryptographically secure pseudorandom number generator";
    authors = [ "Erick Tryzelaar <etryzelaar@google.com>" ];
    edition = "2018";
    sha256 = "07apwv9dj716yjlcj29p94vkqn5zmfh7hlrqvrjx3wzshphc95h9";
  };
  features_.fuchsia_cprng."0.1.1" = deps: f: updateFeatures f (rec {
    fuchsia_cprng."0.1.1".default = (f.fuchsia_cprng."0.1.1".default or true);
  }) [];


# end
# getopts-0.2.18

  crates.getopts."0.2.18" = deps: { features?(features_.getopts."0.2.18" deps {}) }: buildRustCrate {
    crateName = "getopts";
    version = "0.2.18";
    description = "getopts-like option parsing.\n";
    authors = [ "The Rust Project Developers" ];
    sha256 = "0c1m95wg8pkvdq4mwcd2v78r1lb6a5s3ljm7158dsl56mvzcwd5y";
    dependencies = mapFeatures features ([
      (crates."unicode_width"."${deps."getopts"."0.2.18"."unicode_width"}" deps)
    ]);
  };
  features_.getopts."0.2.18" = deps: f: updateFeatures f (rec {
    getopts."0.2.18".default = (f.getopts."0.2.18".default or true);
    unicode_width."${deps.getopts."0.2.18".unicode_width}".default = true;
  }) [
    (features_.unicode_width."${deps."getopts"."0.2.18"."unicode_width"}" deps)
  ];


# end
# itertools-0.7.11

  crates.itertools."0.7.11" = deps: { features?(features_.itertools."0.7.11" deps {}) }: buildRustCrate {
    crateName = "itertools";
    version = "0.7.11";
    description = "Extra iterator adaptors, iterator methods, free functions, and macros.";
    authors = [ "bluss" ];
    sha256 = "0gavmkvn2c3cwfwk5zl5p7saiqn4ww227am5ykn6pgfm7c6ppz56";
    dependencies = mapFeatures features ([
      (crates."either"."${deps."itertools"."0.7.11"."either"}" deps)
    ]);
    features = mkFeatures (features."itertools"."0.7.11" or {});
  };
  features_.itertools."0.7.11" = deps: f: updateFeatures f (rec {
    either."${deps.itertools."0.7.11".either}".default = (f.either."${deps.itertools."0.7.11".either}".default or false);
    itertools = fold recursiveUpdate {} [
      { "0.7.11"."use_std" =
        (f.itertools."0.7.11"."use_std" or false) ||
        (f.itertools."0.7.11".default or false) ||
        (itertools."0.7.11"."default" or false); }
      { "0.7.11".default = (f.itertools."0.7.11".default or true); }
    ];
  }) [
    (features_.either."${deps."itertools"."0.7.11"."either"}" deps)
  ];


# end
# itoa-0.4.3

  crates.itoa."0.4.3" = deps: { features?(features_.itoa."0.4.3" deps {}) }: buildRustCrate {
    crateName = "itoa";
    version = "0.4.3";
    description = "Fast functions for printing integer primitives to an io::Write";
    authors = [ "David Tolnay <dtolnay@gmail.com>" ];
    sha256 = "0zadimmdgvili3gdwxqg7ljv3r4wcdg1kkdfp9nl15vnm23vrhy1";
    features = mkFeatures (features."itoa"."0.4.3" or {});
  };
  features_.itoa."0.4.3" = deps: f: updateFeatures f (rec {
    itoa = fold recursiveUpdate {} [
      { "0.4.3"."std" =
        (f.itoa."0.4.3"."std" or false) ||
        (f.itoa."0.4.3".default or false) ||
        (itoa."0.4.3"."default" or false); }
      { "0.4.3".default = (f.itoa."0.4.3".default or true); }
    ];
  }) [];


# end
# kernel32-sys-0.2.2

  crates.kernel32_sys."0.2.2" = deps: { features?(features_.kernel32_sys."0.2.2" deps {}) }: buildRustCrate {
    crateName = "kernel32-sys";
    version = "0.2.2";
    description = "Contains function definitions for the Windows API library kernel32. See winapi for types and constants.";
    authors = [ "Peter Atashian <retep998@gmail.com>" ];
    sha256 = "1lrw1hbinyvr6cp28g60z97w32w8vsk6pahk64pmrv2fmby8srfj";
    libName = "kernel32";
    build = "build.rs";
    dependencies = mapFeatures features ([
      (crates."winapi"."${deps."kernel32_sys"."0.2.2"."winapi"}" deps)
    ]);

    buildDependencies = mapFeatures features ([
      (crates."winapi_build"."${deps."kernel32_sys"."0.2.2"."winapi_build"}" deps)
    ]);
  };
  features_.kernel32_sys."0.2.2" = deps: f: updateFeatures f (rec {
    kernel32_sys."0.2.2".default = (f.kernel32_sys."0.2.2".default or true);
    winapi."${deps.kernel32_sys."0.2.2".winapi}".default = true;
    winapi_build."${deps.kernel32_sys."0.2.2".winapi_build}".default = true;
  }) [
    (features_.winapi."${deps."kernel32_sys"."0.2.2"."winapi"}" deps)
    (features_.winapi_build."${deps."kernel32_sys"."0.2.2"."winapi_build"}" deps)
  ];


# end
# lazy_static-0.2.11

  crates.lazy_static."0.2.11" = deps: { features?(features_.lazy_static."0.2.11" deps {}) }: buildRustCrate {
    crateName = "lazy_static";
    version = "0.2.11";
    description = "A macro for declaring lazily evaluated statics in Rust.";
    authors = [ "Marvin Löbel <loebel.marvin@gmail.com>" ];
    sha256 = "1x6871cvpy5b96yv4c7jvpq316fp5d4609s9py7qk6cd6x9k34vm";
    dependencies = mapFeatures features ([
]);
    features = mkFeatures (features."lazy_static"."0.2.11" or {});
  };
  features_.lazy_static."0.2.11" = deps: f: updateFeatures f (rec {
    lazy_static = fold recursiveUpdate {} [
      { "0.2.11"."compiletest_rs" =
        (f.lazy_static."0.2.11"."compiletest_rs" or false) ||
        (f.lazy_static."0.2.11".compiletest or false) ||
        (lazy_static."0.2.11"."compiletest" or false); }
      { "0.2.11"."nightly" =
        (f.lazy_static."0.2.11"."nightly" or false) ||
        (f.lazy_static."0.2.11".spin_no_std or false) ||
        (lazy_static."0.2.11"."spin_no_std" or false); }
      { "0.2.11"."spin" =
        (f.lazy_static."0.2.11"."spin" or false) ||
        (f.lazy_static."0.2.11".spin_no_std or false) ||
        (lazy_static."0.2.11"."spin_no_std" or false); }
      { "0.2.11".default = (f.lazy_static."0.2.11".default or true); }
    ];
  }) [];


# end
# lazy_static-1.3.0

  crates.lazy_static."1.3.0" = deps: { features?(features_.lazy_static."1.3.0" deps {}) }: buildRustCrate {
    crateName = "lazy_static";
    version = "1.3.0";
    description = "A macro for declaring lazily evaluated statics in Rust.";
    authors = [ "Marvin Löbel <loebel.marvin@gmail.com>" ];
    sha256 = "1vv47va18ydk7dx5paz88g3jy1d3lwbx6qpxkbj8gyfv770i4b1y";
    dependencies = mapFeatures features ([
]);
    features = mkFeatures (features."lazy_static"."1.3.0" or {});
  };
  features_.lazy_static."1.3.0" = deps: f: updateFeatures f (rec {
    lazy_static = fold recursiveUpdate {} [
      { "1.3.0"."spin" =
        (f.lazy_static."1.3.0"."spin" or false) ||
        (f.lazy_static."1.3.0".spin_no_std or false) ||
        (lazy_static."1.3.0"."spin_no_std" or false); }
      { "1.3.0".default = (f.lazy_static."1.3.0".default or true); }
    ];
  }) [];


# end
# libc-0.2.51

  crates.libc."0.2.51" = deps: { features?(features_.libc."0.2.51" deps {}) }: buildRustCrate {
    crateName = "libc";
    version = "0.2.51";
    description = "Raw FFI bindings to platform libraries like libc.\n";
    authors = [ "The Rust Project Developers" ];
    sha256 = "1lzavxj1ymm7vghs6nmzq9shprdlqby73py9k30gwvv0dwy365cv";
    build = "build.rs";
    dependencies = mapFeatures features ([
]);
    features = mkFeatures (features."libc"."0.2.51" or {});
  };
  features_.libc."0.2.51" = deps: f: updateFeatures f (rec {
    libc = fold recursiveUpdate {} [
      { "0.2.51"."align" =
        (f.libc."0.2.51"."align" or false) ||
        (f.libc."0.2.51".rustc-dep-of-std or false) ||
        (libc."0.2.51"."rustc-dep-of-std" or false); }
      { "0.2.51"."rustc-std-workspace-core" =
        (f.libc."0.2.51"."rustc-std-workspace-core" or false) ||
        (f.libc."0.2.51".rustc-dep-of-std or false) ||
        (libc."0.2.51"."rustc-dep-of-std" or false); }
      { "0.2.51"."use_std" =
        (f.libc."0.2.51"."use_std" or false) ||
        (f.libc."0.2.51".default or false) ||
        (libc."0.2.51"."default" or false); }
      { "0.2.51".default = (f.libc."0.2.51".default or true); }
    ];
  }) [];


# end
# log-0.4.6

  crates.log."0.4.6" = deps: { features?(features_.log."0.4.6" deps {}) }: buildRustCrate {
    crateName = "log";
    version = "0.4.6";
    description = "A lightweight logging facade for Rust\n";
    authors = [ "The Rust Project Developers" ];
    sha256 = "1nd8dl9mvc9vd6fks5d4gsxaz990xi6rzlb8ymllshmwi153vngr";
    dependencies = mapFeatures features ([
      (crates."cfg_if"."${deps."log"."0.4.6"."cfg_if"}" deps)
    ]);
    features = mkFeatures (features."log"."0.4.6" or {});
  };
  features_.log."0.4.6" = deps: f: updateFeatures f (rec {
    cfg_if."${deps.log."0.4.6".cfg_if}".default = true;
    log."0.4.6".default = (f.log."0.4.6".default or true);
  }) [
    (features_.cfg_if."${deps."log"."0.4.6"."cfg_if"}" deps)
  ];


# end
# malloc_buf-0.0.6

  crates.malloc_buf."0.0.6" = deps: { features?(features_.malloc_buf."0.0.6" deps {}) }: buildRustCrate {
    crateName = "malloc_buf";
    version = "0.0.6";
    description = "Structs for handling malloc'd memory passed to Rust.";
    authors = [ "Steven Sheldon" ];
    sha256 = "0g3n9a74vnvz3ip8fp90ss2jwr27mzkb5q6r61fcv8n829rwhxfp";
    dependencies = mapFeatures features ([
      (crates."libc"."${deps."malloc_buf"."0.0.6"."libc"}" deps)
    ]);
  };
  features_.malloc_buf."0.0.6" = deps: f: updateFeatures f (rec {
    libc."${deps.malloc_buf."0.0.6".libc}".default = true;
    malloc_buf."0.0.6".default = (f.malloc_buf."0.0.6".default or true);
  }) [
    (features_.libc."${deps."malloc_buf"."0.0.6"."libc"}" deps)
  ];


# end
# memchr-1.0.2

  crates.memchr."1.0.2" = deps: { features?(features_.memchr."1.0.2" deps {}) }: buildRustCrate {
    crateName = "memchr";
    version = "1.0.2";
    description = "Safe interface to memchr.";
    authors = [ "Andrew Gallant <jamslam@gmail.com>" "bluss" ];
    sha256 = "0dfb8ifl9nrc9kzgd5z91q6qg87sh285q1ih7xgrsglmqfav9lg7";
    dependencies = mapFeatures features ([
    ]
      ++ (if features.memchr."1.0.2".libc or false then [ (crates.libc."${deps."memchr"."1.0.2".libc}" deps) ] else []));
    features = mkFeatures (features."memchr"."1.0.2" or {});
  };
  features_.memchr."1.0.2" = deps: f: updateFeatures f (rec {
    libc = fold recursiveUpdate {} [
      { "${deps.memchr."1.0.2".libc}"."use_std" =
        (f.libc."${deps.memchr."1.0.2".libc}"."use_std" or false) ||
        (memchr."1.0.2"."use_std" or false) ||
        (f."memchr"."1.0.2"."use_std" or false); }
      { "${deps.memchr."1.0.2".libc}".default = (f.libc."${deps.memchr."1.0.2".libc}".default or false); }
    ];
    memchr = fold recursiveUpdate {} [
      { "1.0.2"."libc" =
        (f.memchr."1.0.2"."libc" or false) ||
        (f.memchr."1.0.2".default or false) ||
        (memchr."1.0.2"."default" or false) ||
        (f.memchr."1.0.2".use_std or false) ||
        (memchr."1.0.2"."use_std" or false); }
      { "1.0.2"."use_std" =
        (f.memchr."1.0.2"."use_std" or false) ||
        (f.memchr."1.0.2".default or false) ||
        (memchr."1.0.2"."default" or false); }
      { "1.0.2".default = (f.memchr."1.0.2".default or true); }
    ];
  }) [
    (features_.libc."${deps."memchr"."1.0.2"."libc"}" deps)
  ];


# end
# memchr-2.2.0

  crates.memchr."2.2.0" = deps: { features?(features_.memchr."2.2.0" deps {}) }: buildRustCrate {
    crateName = "memchr";
    version = "2.2.0";
    description = "Safe interface to memchr.";
    authors = [ "Andrew Gallant <jamslam@gmail.com>" "bluss" ];
    sha256 = "11vwg8iig9jyjxq3n1cq15g29ikzw5l7ar87md54k1aisjs0997p";
    dependencies = mapFeatures features ([
]);
    features = mkFeatures (features."memchr"."2.2.0" or {});
  };
  features_.memchr."2.2.0" = deps: f: updateFeatures f (rec {
    memchr = fold recursiveUpdate {} [
      { "2.2.0"."use_std" =
        (f.memchr."2.2.0"."use_std" or false) ||
        (f.memchr."2.2.0".default or false) ||
        (memchr."2.2.0"."default" or false); }
      { "2.2.0".default = (f.memchr."2.2.0".default or true); }
    ];
  }) [];


# end
# nodrop-0.1.13

  crates.nodrop."0.1.13" = deps: { features?(features_.nodrop."0.1.13" deps {}) }: buildRustCrate {
    crateName = "nodrop";
    version = "0.1.13";
    description = "A wrapper type to inhibit drop (destructor). Use std::mem::ManuallyDrop instead!";
    authors = [ "bluss" ];
    sha256 = "0gkfx6wihr9z0m8nbdhma5pyvbipznjpkzny2d4zkc05b0vnhinb";
    dependencies = mapFeatures features ([
]);
    features = mkFeatures (features."nodrop"."0.1.13" or {});
  };
  features_.nodrop."0.1.13" = deps: f: updateFeatures f (rec {
    nodrop = fold recursiveUpdate {} [
      { "0.1.13"."nodrop-union" =
        (f.nodrop."0.1.13"."nodrop-union" or false) ||
        (f.nodrop."0.1.13".use_union or false) ||
        (nodrop."0.1.13"."use_union" or false); }
      { "0.1.13"."std" =
        (f.nodrop."0.1.13"."std" or false) ||
        (f.nodrop."0.1.13".default or false) ||
        (nodrop."0.1.13"."default" or false); }
      { "0.1.13".default = (f.nodrop."0.1.13".default or true); }
    ];
  }) [];


# end
# objc-0.2.6

  crates.objc."0.2.6" = deps: { features?(features_.objc."0.2.6" deps {}) }: buildRustCrate {
    crateName = "objc";
    version = "0.2.6";
    description = "Objective-C Runtime bindings and wrapper for Rust.";
    authors = [ "Steven Sheldon" ];
    sha256 = "1l6q3dx9qr8slvmf4z9ivdh9q9yzp1v01d9am9mr9ybqhhkviav0";
    dependencies = mapFeatures features ([
      (crates."malloc_buf"."${deps."objc"."0.2.6"."malloc_buf"}" deps)
    ]);
    features = mkFeatures (features."objc"."0.2.6" or {});
  };
  features_.objc."0.2.6" = deps: f: updateFeatures f (rec {
    malloc_buf."${deps.objc."0.2.6".malloc_buf}".default = true;
    objc = fold recursiveUpdate {} [
      { "0.2.6"."objc_exception" =
        (f.objc."0.2.6"."objc_exception" or false) ||
        (f.objc."0.2.6".exception or false) ||
        (objc."0.2.6"."exception" or false); }
      { "0.2.6".default = (f.objc."0.2.6".default or true); }
    ];
  }) [
    (features_.malloc_buf."${deps."objc"."0.2.6"."malloc_buf"}" deps)
  ];


# end
# objc-foundation-0.1.1

  crates.objc_foundation."0.1.1" = deps: { features?(features_.objc_foundation."0.1.1" deps {}) }: buildRustCrate {
    crateName = "objc-foundation";
    version = "0.1.1";
    description = "Rust wrapper for Objective-C's Foundation framework.";
    authors = [ "Steven Sheldon" ];
    sha256 = "0xab2xw363mmp4gchxa4sjbh9dlivvcqc03h85lx0nhmxyim1cgw";
    dependencies = mapFeatures features ([
      (crates."block"."${deps."objc_foundation"."0.1.1"."block"}" deps)
      (crates."objc"."${deps."objc_foundation"."0.1.1"."objc"}" deps)
      (crates."objc_id"."${deps."objc_foundation"."0.1.1"."objc_id"}" deps)
    ]);
  };
  features_.objc_foundation."0.1.1" = deps: f: updateFeatures f (rec {
    block."${deps.objc_foundation."0.1.1".block}".default = true;
    objc."${deps.objc_foundation."0.1.1".objc}".default = true;
    objc_foundation."0.1.1".default = (f.objc_foundation."0.1.1".default or true);
    objc_id."${deps.objc_foundation."0.1.1".objc_id}".default = true;
  }) [
    (features_.block."${deps."objc_foundation"."0.1.1"."block"}" deps)
    (features_.objc."${deps."objc_foundation"."0.1.1"."objc"}" deps)
    (features_.objc_id."${deps."objc_foundation"."0.1.1"."objc_id"}" deps)
  ];


# end
# objc_id-0.1.1

  crates.objc_id."0.1.1" = deps: { features?(features_.objc_id."0.1.1" deps {}) }: buildRustCrate {
    crateName = "objc_id";
    version = "0.1.1";
    description = "Rust smart pointers for Objective-C reference counting.";
    authors = [ "Steven Sheldon" ];
    sha256 = "1zihv1gcipcs3jr6dz8d6yglm4xp7z8560l83hb5hgmyniqafmlh";
    dependencies = mapFeatures features ([
      (crates."objc"."${deps."objc_id"."0.1.1"."objc"}" deps)
    ]);
  };
  features_.objc_id."0.1.1" = deps: f: updateFeatures f (rec {
    objc."${deps.objc_id."0.1.1".objc}".default = true;
    objc_id."0.1.1".default = (f.objc_id."0.1.1".default or true);
  }) [
    (features_.objc."${deps."objc_id"."0.1.1"."objc"}" deps)
  ];


# end
# openssl-0.10.20

  crates.openssl."0.10.20" = deps: { features?(features_.openssl."0.10.20" deps {}) }: buildRustCrate {
    crateName = "openssl";
    version = "0.10.20";
    description = "OpenSSL bindings";
    authors = [ "Steven Fackler <sfackler@gmail.com>" ];
    sha256 = "1y3zkq988vx48a4j0i23mr7vm1wy5w71yws2v6hyf4vb5iw3r5s5";
    dependencies = mapFeatures features ([
      (crates."bitflags"."${deps."openssl"."0.10.20"."bitflags"}" deps)
      (crates."cfg_if"."${deps."openssl"."0.10.20"."cfg_if"}" deps)
      (crates."foreign_types"."${deps."openssl"."0.10.20"."foreign_types"}" deps)
      (crates."lazy_static"."${deps."openssl"."0.10.20"."lazy_static"}" deps)
      (crates."libc"."${deps."openssl"."0.10.20"."libc"}" deps)
      (crates."openssl_sys"."${deps."openssl"."0.10.20"."openssl_sys"}" deps)
    ]);
    features = mkFeatures (features."openssl"."0.10.20" or {});
  };
  features_.openssl."0.10.20" = deps: f: updateFeatures f (rec {
    bitflags."${deps.openssl."0.10.20".bitflags}".default = true;
    cfg_if."${deps.openssl."0.10.20".cfg_if}".default = true;
    foreign_types."${deps.openssl."0.10.20".foreign_types}".default = true;
    lazy_static."${deps.openssl."0.10.20".lazy_static}".default = true;
    libc."${deps.openssl."0.10.20".libc}".default = true;
    openssl."0.10.20".default = (f.openssl."0.10.20".default or true);
    openssl_sys = fold recursiveUpdate {} [
      { "${deps.openssl."0.10.20".openssl_sys}"."vendored" =
        (f.openssl_sys."${deps.openssl."0.10.20".openssl_sys}"."vendored" or false) ||
        (openssl."0.10.20"."vendored" or false) ||
        (f."openssl"."0.10.20"."vendored" or false); }
      { "${deps.openssl."0.10.20".openssl_sys}".default = true; }
    ];
  }) [
    (features_.bitflags."${deps."openssl"."0.10.20"."bitflags"}" deps)
    (features_.cfg_if."${deps."openssl"."0.10.20"."cfg_if"}" deps)
    (features_.foreign_types."${deps."openssl"."0.10.20"."foreign_types"}" deps)
    (features_.lazy_static."${deps."openssl"."0.10.20"."lazy_static"}" deps)
    (features_.libc."${deps."openssl"."0.10.20"."libc"}" deps)
    (features_.openssl_sys."${deps."openssl"."0.10.20"."openssl_sys"}" deps)
  ];


# end
# openssl-sys-0.9.43

  crates.openssl_sys."0.9.43" = deps: { features?(features_.openssl_sys."0.9.43" deps {}) }: buildRustCrate {
    crateName = "openssl-sys";
    version = "0.9.43";
    description = "FFI bindings to OpenSSL";
    authors = [ "Alex Crichton <alex@alexcrichton.com>" "Steven Fackler <sfackler@gmail.com>" ];
    sha256 = "1ip0f94jakr85pxjhrkg9w9lgiiy1yga3ckm6c8xb13klsr7ky9y";
    build = "build/main.rs";
    dependencies = mapFeatures features ([
      (crates."libc"."${deps."openssl_sys"."0.9.43"."libc"}" deps)
    ])
      ++ (if abi == "msvc" then mapFeatures features ([
]) else []);

    buildDependencies = mapFeatures features ([
      (crates."cc"."${deps."openssl_sys"."0.9.43"."cc"}" deps)
      (crates."pkg_config"."${deps."openssl_sys"."0.9.43"."pkg_config"}" deps)
      (crates."rustc_version"."${deps."openssl_sys"."0.9.43"."rustc_version"}" deps)
    ]);
    features = mkFeatures (features."openssl_sys"."0.9.43" or {});
  };
  features_.openssl_sys."0.9.43" = deps: f: updateFeatures f (rec {
    cc."${deps.openssl_sys."0.9.43".cc}".default = true;
    libc."${deps.openssl_sys."0.9.43".libc}".default = true;
    openssl_sys = fold recursiveUpdate {} [
      { "0.9.43"."openssl-src" =
        (f.openssl_sys."0.9.43"."openssl-src" or false) ||
        (f.openssl_sys."0.9.43".vendored or false) ||
        (openssl_sys."0.9.43"."vendored" or false); }
      { "0.9.43".default = (f.openssl_sys."0.9.43".default or true); }
    ];
    pkg_config."${deps.openssl_sys."0.9.43".pkg_config}".default = true;
    rustc_version."${deps.openssl_sys."0.9.43".rustc_version}".default = true;
  }) [
    (features_.libc."${deps."openssl_sys"."0.9.43"."libc"}" deps)
    (features_.cc."${deps."openssl_sys"."0.9.43"."cc"}" deps)
    (features_.pkg_config."${deps."openssl_sys"."0.9.43"."pkg_config"}" deps)
    (features_.rustc_version."${deps."openssl_sys"."0.9.43"."rustc_version"}" deps)
  ];


# end
# pkg-config-0.3.14

  crates.pkg_config."0.3.14" = deps: { features?(features_.pkg_config."0.3.14" deps {}) }: buildRustCrate {
    crateName = "pkg-config";
    version = "0.3.14";
    description = "A library to run the pkg-config system tool at build time in order to be used in\nCargo build scripts.\n";
    authors = [ "Alex Crichton <alex@alexcrichton.com>" ];
    sha256 = "0207fsarrm412j0dh87lfcas72n8mxar7q3mgflsbsrqnb140sv6";
  };
  features_.pkg_config."0.3.14" = deps: f: updateFeatures f (rec {
    pkg_config."0.3.14".default = (f.pkg_config."0.3.14".default or true);
  }) [];


# end
# proc-macro2-0.4.27

  crates.proc_macro2."0.4.27" = deps: { features?(features_.proc_macro2."0.4.27" deps {}) }: buildRustCrate {
    crateName = "proc-macro2";
    version = "0.4.27";
    description = "A stable implementation of the upcoming new `proc_macro` API. Comes with an\noption, off by default, to also reimplement itself in terms of the upstream\nunstable API.\n";
    authors = [ "Alex Crichton <alex@alexcrichton.com>" ];
    sha256 = "1cp4c40p3hwn2sz72ssqa62gp5n8w4gbamdqvvadzp5l7gxnq95i";
    build = "build.rs";
    dependencies = mapFeatures features ([
      (crates."unicode_xid"."${deps."proc_macro2"."0.4.27"."unicode_xid"}" deps)
    ]);
    features = mkFeatures (features."proc_macro2"."0.4.27" or {});
  };
  features_.proc_macro2."0.4.27" = deps: f: updateFeatures f (rec {
    proc_macro2 = fold recursiveUpdate {} [
      { "0.4.27"."proc-macro" =
        (f.proc_macro2."0.4.27"."proc-macro" or false) ||
        (f.proc_macro2."0.4.27".default or false) ||
        (proc_macro2."0.4.27"."default" or false); }
      { "0.4.27".default = (f.proc_macro2."0.4.27".default or true); }
    ];
    unicode_xid."${deps.proc_macro2."0.4.27".unicode_xid}".default = true;
  }) [
    (features_.unicode_xid."${deps."proc_macro2"."0.4.27"."unicode_xid"}" deps)
  ];


# end
# quick-error-1.2.2

  crates.quick_error."1.2.2" = deps: { features?(features_.quick_error."1.2.2" deps {}) }: buildRustCrate {
    crateName = "quick-error";
    version = "1.2.2";
    description = "    A macro which makes error types pleasant to write.\n";
    authors = [ "Paul Colomiets <paul@colomiets.name>" "Colin Kiegel <kiegel@gmx.de>" ];
    sha256 = "192a3adc5phgpibgqblsdx1b421l5yg9bjbmv552qqq9f37h60k5";
  };
  features_.quick_error."1.2.2" = deps: f: updateFeatures f (rec {
    quick_error."1.2.2".default = (f.quick_error."1.2.2".default or true);
  }) [];


# end
# quote-0.3.15

  crates.quote."0.3.15" = deps: { features?(features_.quote."0.3.15" deps {}) }: buildRustCrate {
    crateName = "quote";
    version = "0.3.15";
    description = "Quasi-quoting macro quote!(...)";
    authors = [ "David Tolnay <dtolnay@gmail.com>" ];
    sha256 = "09il61jv4kd1360spaj46qwyl21fv1qz18fsv2jra8wdnlgl5jsg";
  };
  features_.quote."0.3.15" = deps: f: updateFeatures f (rec {
    quote."0.3.15".default = (f.quote."0.3.15".default or true);
  }) [];


# end
# quote-0.6.11

  crates.quote."0.6.11" = deps: { features?(features_.quote."0.6.11" deps {}) }: buildRustCrate {
    crateName = "quote";
    version = "0.6.11";
    description = "Quasi-quoting macro quote!(...)";
    authors = [ "David Tolnay <dtolnay@gmail.com>" ];
    sha256 = "0agska77z58cypcq4knayzwx7r7n6m756z1cz9cp2z4sv0b846ga";
    dependencies = mapFeatures features ([
      (crates."proc_macro2"."${deps."quote"."0.6.11"."proc_macro2"}" deps)
    ]);
    features = mkFeatures (features."quote"."0.6.11" or {});
  };
  features_.quote."0.6.11" = deps: f: updateFeatures f (rec {
    proc_macro2 = fold recursiveUpdate {} [
      { "${deps.quote."0.6.11".proc_macro2}"."proc-macro" =
        (f.proc_macro2."${deps.quote."0.6.11".proc_macro2}"."proc-macro" or false) ||
        (quote."0.6.11"."proc-macro" or false) ||
        (f."quote"."0.6.11"."proc-macro" or false); }
      { "${deps.quote."0.6.11".proc_macro2}".default = (f.proc_macro2."${deps.quote."0.6.11".proc_macro2}".default or false); }
    ];
    quote = fold recursiveUpdate {} [
      { "0.6.11"."proc-macro" =
        (f.quote."0.6.11"."proc-macro" or false) ||
        (f.quote."0.6.11".default or false) ||
        (quote."0.6.11"."default" or false); }
      { "0.6.11".default = (f.quote."0.6.11".default or true); }
    ];
  }) [
    (features_.proc_macro2."${deps."quote"."0.6.11"."proc_macro2"}" deps)
  ];


# end
# rand-0.6.5

  crates.rand."0.6.5" = deps: { features?(features_.rand."0.6.5" deps {}) }: buildRustCrate {
    crateName = "rand";
    version = "0.6.5";
    description = "Random number generators and other randomness functionality.\n";
    authors = [ "The Rand Project Developers" "The Rust Project Developers" ];
    sha256 = "0zbck48159aj8zrwzf80sd9xxh96w4f4968nshwjpysjvflimvgb";
    build = "build.rs";
    dependencies = mapFeatures features ([
      (crates."rand_chacha"."${deps."rand"."0.6.5"."rand_chacha"}" deps)
      (crates."rand_core"."${deps."rand"."0.6.5"."rand_core"}" deps)
      (crates."rand_hc"."${deps."rand"."0.6.5"."rand_hc"}" deps)
      (crates."rand_isaac"."${deps."rand"."0.6.5"."rand_isaac"}" deps)
      (crates."rand_jitter"."${deps."rand"."0.6.5"."rand_jitter"}" deps)
      (crates."rand_pcg"."${deps."rand"."0.6.5"."rand_pcg"}" deps)
      (crates."rand_xorshift"."${deps."rand"."0.6.5"."rand_xorshift"}" deps)
    ]
      ++ (if features.rand."0.6.5".rand_os or false then [ (crates.rand_os."${deps."rand"."0.6.5".rand_os}" deps) ] else []))
      ++ (if (kernel == "linux" || kernel == "darwin") then mapFeatures features ([
      (crates."libc"."${deps."rand"."0.6.5"."libc"}" deps)
    ]) else [])
      ++ (if kernel == "windows" then mapFeatures features ([
      (crates."winapi"."${deps."rand"."0.6.5"."winapi"}" deps)
    ]) else []);

    buildDependencies = mapFeatures features ([
      (crates."autocfg"."${deps."rand"."0.6.5"."autocfg"}" deps)
    ]);
    features = mkFeatures (features."rand"."0.6.5" or {});
  };
  features_.rand."0.6.5" = deps: f: updateFeatures f (rec {
    autocfg."${deps.rand."0.6.5".autocfg}".default = true;
    libc."${deps.rand."0.6.5".libc}".default = (f.libc."${deps.rand."0.6.5".libc}".default or false);
    rand = fold recursiveUpdate {} [
      { "0.6.5"."alloc" =
        (f.rand."0.6.5"."alloc" or false) ||
        (f.rand."0.6.5".std or false) ||
        (rand."0.6.5"."std" or false); }
      { "0.6.5"."packed_simd" =
        (f.rand."0.6.5"."packed_simd" or false) ||
        (f.rand."0.6.5".simd_support or false) ||
        (rand."0.6.5"."simd_support" or false); }
      { "0.6.5"."rand_os" =
        (f.rand."0.6.5"."rand_os" or false) ||
        (f.rand."0.6.5".std or false) ||
        (rand."0.6.5"."std" or false); }
      { "0.6.5"."simd_support" =
        (f.rand."0.6.5"."simd_support" or false) ||
        (f.rand."0.6.5".nightly or false) ||
        (rand."0.6.5"."nightly" or false); }
      { "0.6.5"."std" =
        (f.rand."0.6.5"."std" or false) ||
        (f.rand."0.6.5".default or false) ||
        (rand."0.6.5"."default" or false); }
      { "0.6.5".default = (f.rand."0.6.5".default or true); }
    ];
    rand_chacha."${deps.rand."0.6.5".rand_chacha}".default = true;
    rand_core = fold recursiveUpdate {} [
      { "${deps.rand."0.6.5".rand_core}"."alloc" =
        (f.rand_core."${deps.rand."0.6.5".rand_core}"."alloc" or false) ||
        (rand."0.6.5"."alloc" or false) ||
        (f."rand"."0.6.5"."alloc" or false); }
      { "${deps.rand."0.6.5".rand_core}"."serde1" =
        (f.rand_core."${deps.rand."0.6.5".rand_core}"."serde1" or false) ||
        (rand."0.6.5"."serde1" or false) ||
        (f."rand"."0.6.5"."serde1" or false); }
      { "${deps.rand."0.6.5".rand_core}"."std" =
        (f.rand_core."${deps.rand."0.6.5".rand_core}"."std" or false) ||
        (rand."0.6.5"."std" or false) ||
        (f."rand"."0.6.5"."std" or false); }
      { "${deps.rand."0.6.5".rand_core}".default = true; }
    ];
    rand_hc."${deps.rand."0.6.5".rand_hc}".default = true;
    rand_isaac = fold recursiveUpdate {} [
      { "${deps.rand."0.6.5".rand_isaac}"."serde1" =
        (f.rand_isaac."${deps.rand."0.6.5".rand_isaac}"."serde1" or false) ||
        (rand."0.6.5"."serde1" or false) ||
        (f."rand"."0.6.5"."serde1" or false); }
      { "${deps.rand."0.6.5".rand_isaac}".default = true; }
    ];
    rand_jitter = fold recursiveUpdate {} [
      { "${deps.rand."0.6.5".rand_jitter}"."std" =
        (f.rand_jitter."${deps.rand."0.6.5".rand_jitter}"."std" or false) ||
        (rand."0.6.5"."std" or false) ||
        (f."rand"."0.6.5"."std" or false); }
      { "${deps.rand."0.6.5".rand_jitter}".default = true; }
    ];
    rand_os = fold recursiveUpdate {} [
      { "${deps.rand."0.6.5".rand_os}"."stdweb" =
        (f.rand_os."${deps.rand."0.6.5".rand_os}"."stdweb" or false) ||
        (rand."0.6.5"."stdweb" or false) ||
        (f."rand"."0.6.5"."stdweb" or false); }
      { "${deps.rand."0.6.5".rand_os}"."wasm-bindgen" =
        (f.rand_os."${deps.rand."0.6.5".rand_os}"."wasm-bindgen" or false) ||
        (rand."0.6.5"."wasm-bindgen" or false) ||
        (f."rand"."0.6.5"."wasm-bindgen" or false); }
      { "${deps.rand."0.6.5".rand_os}".default = true; }
    ];
    rand_pcg."${deps.rand."0.6.5".rand_pcg}".default = true;
    rand_xorshift = fold recursiveUpdate {} [
      { "${deps.rand."0.6.5".rand_xorshift}"."serde1" =
        (f.rand_xorshift."${deps.rand."0.6.5".rand_xorshift}"."serde1" or false) ||
        (rand."0.6.5"."serde1" or false) ||
        (f."rand"."0.6.5"."serde1" or false); }
      { "${deps.rand."0.6.5".rand_xorshift}".default = true; }
    ];
    winapi = fold recursiveUpdate {} [
      { "${deps.rand."0.6.5".winapi}"."minwindef" = true; }
      { "${deps.rand."0.6.5".winapi}"."ntsecapi" = true; }
      { "${deps.rand."0.6.5".winapi}"."profileapi" = true; }
      { "${deps.rand."0.6.5".winapi}"."winnt" = true; }
      { "${deps.rand."0.6.5".winapi}".default = true; }
    ];
  }) [
    (features_.rand_chacha."${deps."rand"."0.6.5"."rand_chacha"}" deps)
    (features_.rand_core."${deps."rand"."0.6.5"."rand_core"}" deps)
    (features_.rand_hc."${deps."rand"."0.6.5"."rand_hc"}" deps)
    (features_.rand_isaac."${deps."rand"."0.6.5"."rand_isaac"}" deps)
    (features_.rand_jitter."${deps."rand"."0.6.5"."rand_jitter"}" deps)
    (features_.rand_os."${deps."rand"."0.6.5"."rand_os"}" deps)
    (features_.rand_pcg."${deps."rand"."0.6.5"."rand_pcg"}" deps)
    (features_.rand_xorshift."${deps."rand"."0.6.5"."rand_xorshift"}" deps)
    (features_.autocfg."${deps."rand"."0.6.5"."autocfg"}" deps)
    (features_.libc."${deps."rand"."0.6.5"."libc"}" deps)
    (features_.winapi."${deps."rand"."0.6.5"."winapi"}" deps)
  ];


# end
# rand_chacha-0.1.1

  crates.rand_chacha."0.1.1" = deps: { features?(features_.rand_chacha."0.1.1" deps {}) }: buildRustCrate {
    crateName = "rand_chacha";
    version = "0.1.1";
    description = "ChaCha random number generator\n";
    authors = [ "The Rand Project Developers" "The Rust Project Developers" ];
    sha256 = "0xnxm4mjd7wjnh18zxc1yickw58axbycp35ciraplqdfwn1gffwi";
    build = "build.rs";
    dependencies = mapFeatures features ([
      (crates."rand_core"."${deps."rand_chacha"."0.1.1"."rand_core"}" deps)
    ]);

    buildDependencies = mapFeatures features ([
      (crates."autocfg"."${deps."rand_chacha"."0.1.1"."autocfg"}" deps)
    ]);
  };
  features_.rand_chacha."0.1.1" = deps: f: updateFeatures f (rec {
    autocfg."${deps.rand_chacha."0.1.1".autocfg}".default = true;
    rand_chacha."0.1.1".default = (f.rand_chacha."0.1.1".default or true);
    rand_core."${deps.rand_chacha."0.1.1".rand_core}".default = (f.rand_core."${deps.rand_chacha."0.1.1".rand_core}".default or false);
  }) [
    (features_.rand_core."${deps."rand_chacha"."0.1.1"."rand_core"}" deps)
    (features_.autocfg."${deps."rand_chacha"."0.1.1"."autocfg"}" deps)
  ];


# end
# rand_core-0.3.1

  crates.rand_core."0.3.1" = deps: { features?(features_.rand_core."0.3.1" deps {}) }: buildRustCrate {
    crateName = "rand_core";
    version = "0.3.1";
    description = "Core random number generator traits and tools for implementation.\n";
    authors = [ "The Rand Project Developers" "The Rust Project Developers" ];
    sha256 = "0q0ssgpj9x5a6fda83nhmfydy7a6c0wvxm0jhncsmjx8qp8gw91m";
    dependencies = mapFeatures features ([
      (crates."rand_core"."${deps."rand_core"."0.3.1"."rand_core"}" deps)
    ]);
    features = mkFeatures (features."rand_core"."0.3.1" or {});
  };
  features_.rand_core."0.3.1" = deps: f: updateFeatures f (rec {
    rand_core = fold recursiveUpdate {} [
      { "${deps.rand_core."0.3.1".rand_core}"."alloc" =
        (f.rand_core."${deps.rand_core."0.3.1".rand_core}"."alloc" or false) ||
        (rand_core."0.3.1"."alloc" or false) ||
        (f."rand_core"."0.3.1"."alloc" or false); }
      { "${deps.rand_core."0.3.1".rand_core}"."serde1" =
        (f.rand_core."${deps.rand_core."0.3.1".rand_core}"."serde1" or false) ||
        (rand_core."0.3.1"."serde1" or false) ||
        (f."rand_core"."0.3.1"."serde1" or false); }
      { "${deps.rand_core."0.3.1".rand_core}"."std" =
        (f.rand_core."${deps.rand_core."0.3.1".rand_core}"."std" or false) ||
        (rand_core."0.3.1"."std" or false) ||
        (f."rand_core"."0.3.1"."std" or false); }
      { "${deps.rand_core."0.3.1".rand_core}".default = true; }
      { "0.3.1"."std" =
        (f.rand_core."0.3.1"."std" or false) ||
        (f.rand_core."0.3.1".default or false) ||
        (rand_core."0.3.1"."default" or false); }
      { "0.3.1".default = (f.rand_core."0.3.1".default or true); }
    ];
  }) [
    (features_.rand_core."${deps."rand_core"."0.3.1"."rand_core"}" deps)
  ];


# end
# rand_core-0.4.0

  crates.rand_core."0.4.0" = deps: { features?(features_.rand_core."0.4.0" deps {}) }: buildRustCrate {
    crateName = "rand_core";
    version = "0.4.0";
    description = "Core random number generator traits and tools for implementation.\n";
    authors = [ "The Rand Project Developers" "The Rust Project Developers" ];
    sha256 = "0wb5iwhffibj0pnpznhv1g3i7h1fnhz64s3nz74fz6vsm3q6q3br";
    dependencies = mapFeatures features ([
]);
    features = mkFeatures (features."rand_core"."0.4.0" or {});
  };
  features_.rand_core."0.4.0" = deps: f: updateFeatures f (rec {
    rand_core = fold recursiveUpdate {} [
      { "0.4.0"."alloc" =
        (f.rand_core."0.4.0"."alloc" or false) ||
        (f.rand_core."0.4.0".std or false) ||
        (rand_core."0.4.0"."std" or false); }
      { "0.4.0"."serde" =
        (f.rand_core."0.4.0"."serde" or false) ||
        (f.rand_core."0.4.0".serde1 or false) ||
        (rand_core."0.4.0"."serde1" or false); }
      { "0.4.0"."serde_derive" =
        (f.rand_core."0.4.0"."serde_derive" or false) ||
        (f.rand_core."0.4.0".serde1 or false) ||
        (rand_core."0.4.0"."serde1" or false); }
      { "0.4.0".default = (f.rand_core."0.4.0".default or true); }
    ];
  }) [];


# end
# rand_hc-0.1.0

  crates.rand_hc."0.1.0" = deps: { features?(features_.rand_hc."0.1.0" deps {}) }: buildRustCrate {
    crateName = "rand_hc";
    version = "0.1.0";
    description = "HC128 random number generator\n";
    authors = [ "The Rand Project Developers" ];
    sha256 = "05agb75j87yp7y1zk8yf7bpm66hc0673r3dlypn0kazynr6fdgkz";
    dependencies = mapFeatures features ([
      (crates."rand_core"."${deps."rand_hc"."0.1.0"."rand_core"}" deps)
    ]);
  };
  features_.rand_hc."0.1.0" = deps: f: updateFeatures f (rec {
    rand_core."${deps.rand_hc."0.1.0".rand_core}".default = (f.rand_core."${deps.rand_hc."0.1.0".rand_core}".default or false);
    rand_hc."0.1.0".default = (f.rand_hc."0.1.0".default or true);
  }) [
    (features_.rand_core."${deps."rand_hc"."0.1.0"."rand_core"}" deps)
  ];


# end
# rand_isaac-0.1.1

  crates.rand_isaac."0.1.1" = deps: { features?(features_.rand_isaac."0.1.1" deps {}) }: buildRustCrate {
    crateName = "rand_isaac";
    version = "0.1.1";
    description = "ISAAC random number generator\n";
    authors = [ "The Rand Project Developers" "The Rust Project Developers" ];
    sha256 = "10hhdh5b5sa03s6b63y9bafm956jwilx41s71jbrzl63ccx8lxdq";
    dependencies = mapFeatures features ([
      (crates."rand_core"."${deps."rand_isaac"."0.1.1"."rand_core"}" deps)
    ]);
    features = mkFeatures (features."rand_isaac"."0.1.1" or {});
  };
  features_.rand_isaac."0.1.1" = deps: f: updateFeatures f (rec {
    rand_core = fold recursiveUpdate {} [
      { "${deps.rand_isaac."0.1.1".rand_core}"."serde1" =
        (f.rand_core."${deps.rand_isaac."0.1.1".rand_core}"."serde1" or false) ||
        (rand_isaac."0.1.1"."serde1" or false) ||
        (f."rand_isaac"."0.1.1"."serde1" or false); }
      { "${deps.rand_isaac."0.1.1".rand_core}".default = (f.rand_core."${deps.rand_isaac."0.1.1".rand_core}".default or false); }
    ];
    rand_isaac = fold recursiveUpdate {} [
      { "0.1.1"."serde" =
        (f.rand_isaac."0.1.1"."serde" or false) ||
        (f.rand_isaac."0.1.1".serde1 or false) ||
        (rand_isaac."0.1.1"."serde1" or false); }
      { "0.1.1"."serde_derive" =
        (f.rand_isaac."0.1.1"."serde_derive" or false) ||
        (f.rand_isaac."0.1.1".serde1 or false) ||
        (rand_isaac."0.1.1"."serde1" or false); }
      { "0.1.1".default = (f.rand_isaac."0.1.1".default or true); }
    ];
  }) [
    (features_.rand_core."${deps."rand_isaac"."0.1.1"."rand_core"}" deps)
  ];


# end
# rand_jitter-0.1.3

  crates.rand_jitter."0.1.3" = deps: { features?(features_.rand_jitter."0.1.3" deps {}) }: buildRustCrate {
    crateName = "rand_jitter";
    version = "0.1.3";
    description = "Random number generator based on timing jitter";
    authors = [ "The Rand Project Developers" ];
    sha256 = "1cb4q73rmh1inlx3liy6rabapcqh6p6c1plsd2lxw6dmi67d1qc3";
    dependencies = mapFeatures features ([
      (crates."rand_core"."${deps."rand_jitter"."0.1.3"."rand_core"}" deps)
    ])
      ++ (if kernel == "darwin" || kernel == "ios" then mapFeatures features ([
      (crates."libc"."${deps."rand_jitter"."0.1.3"."libc"}" deps)
    ]) else [])
      ++ (if kernel == "windows" then mapFeatures features ([
      (crates."winapi"."${deps."rand_jitter"."0.1.3"."winapi"}" deps)
    ]) else []);
    features = mkFeatures (features."rand_jitter"."0.1.3" or {});
  };
  features_.rand_jitter."0.1.3" = deps: f: updateFeatures f (rec {
    libc."${deps.rand_jitter."0.1.3".libc}".default = true;
    rand_core = fold recursiveUpdate {} [
      { "${deps.rand_jitter."0.1.3".rand_core}"."std" =
        (f.rand_core."${deps.rand_jitter."0.1.3".rand_core}"."std" or false) ||
        (rand_jitter."0.1.3"."std" or false) ||
        (f."rand_jitter"."0.1.3"."std" or false); }
      { "${deps.rand_jitter."0.1.3".rand_core}".default = true; }
    ];
    rand_jitter."0.1.3".default = (f.rand_jitter."0.1.3".default or true);
    winapi = fold recursiveUpdate {} [
      { "${deps.rand_jitter."0.1.3".winapi}"."profileapi" = true; }
      { "${deps.rand_jitter."0.1.3".winapi}".default = true; }
    ];
  }) [
    (features_.rand_core."${deps."rand_jitter"."0.1.3"."rand_core"}" deps)
    (features_.libc."${deps."rand_jitter"."0.1.3"."libc"}" deps)
    (features_.winapi."${deps."rand_jitter"."0.1.3"."winapi"}" deps)
  ];


# end
# rand_os-0.1.3

  crates.rand_os."0.1.3" = deps: { features?(features_.rand_os."0.1.3" deps {}) }: buildRustCrate {
    crateName = "rand_os";
    version = "0.1.3";
    description = "OS backed Random Number Generator";
    authors = [ "The Rand Project Developers" ];
    sha256 = "0ywwspizgs9g8vzn6m5ix9yg36n15119d6n792h7mk4r5vs0ww4j";
    dependencies = mapFeatures features ([
      (crates."rand_core"."${deps."rand_os"."0.1.3"."rand_core"}" deps)
    ])
      ++ (if abi == "sgx" then mapFeatures features ([
      (crates."rdrand"."${deps."rand_os"."0.1.3"."rdrand"}" deps)
    ]) else [])
      ++ (if kernel == "cloudabi" then mapFeatures features ([
      (crates."cloudabi"."${deps."rand_os"."0.1.3"."cloudabi"}" deps)
    ]) else [])
      ++ (if kernel == "fuchsia" then mapFeatures features ([
      (crates."fuchsia_cprng"."${deps."rand_os"."0.1.3"."fuchsia_cprng"}" deps)
    ]) else [])
      ++ (if (kernel == "linux" || kernel == "darwin") then mapFeatures features ([
      (crates."libc"."${deps."rand_os"."0.1.3"."libc"}" deps)
    ]) else [])
      ++ (if kernel == "windows" then mapFeatures features ([
      (crates."winapi"."${deps."rand_os"."0.1.3"."winapi"}" deps)
    ]) else [])
      ++ (if kernel == "wasm32-unknown-unknown" then mapFeatures features ([
]) else []);
  };
  features_.rand_os."0.1.3" = deps: f: updateFeatures f (rec {
    cloudabi."${deps.rand_os."0.1.3".cloudabi}".default = true;
    fuchsia_cprng."${deps.rand_os."0.1.3".fuchsia_cprng}".default = true;
    libc."${deps.rand_os."0.1.3".libc}".default = true;
    rand_core = fold recursiveUpdate {} [
      { "${deps.rand_os."0.1.3".rand_core}"."std" = true; }
      { "${deps.rand_os."0.1.3".rand_core}".default = true; }
    ];
    rand_os."0.1.3".default = (f.rand_os."0.1.3".default or true);
    rdrand."${deps.rand_os."0.1.3".rdrand}".default = true;
    winapi = fold recursiveUpdate {} [
      { "${deps.rand_os."0.1.3".winapi}"."minwindef" = true; }
      { "${deps.rand_os."0.1.3".winapi}"."ntsecapi" = true; }
      { "${deps.rand_os."0.1.3".winapi}"."winnt" = true; }
      { "${deps.rand_os."0.1.3".winapi}".default = true; }
    ];
  }) [
    (features_.rand_core."${deps."rand_os"."0.1.3"."rand_core"}" deps)
    (features_.rdrand."${deps."rand_os"."0.1.3"."rdrand"}" deps)
    (features_.cloudabi."${deps."rand_os"."0.1.3"."cloudabi"}" deps)
    (features_.fuchsia_cprng."${deps."rand_os"."0.1.3"."fuchsia_cprng"}" deps)
    (features_.libc."${deps."rand_os"."0.1.3"."libc"}" deps)
    (features_.winapi."${deps."rand_os"."0.1.3"."winapi"}" deps)
  ];


# end
# rand_pcg-0.1.2

  crates.rand_pcg."0.1.2" = deps: { features?(features_.rand_pcg."0.1.2" deps {}) }: buildRustCrate {
    crateName = "rand_pcg";
    version = "0.1.2";
    description = "Selected PCG random number generators\n";
    authors = [ "The Rand Project Developers" ];
    sha256 = "04qgi2ai2z42li5h4aawvxbpnlqyjfnipz9d6k73mdnl6p1xq938";
    build = "build.rs";
    dependencies = mapFeatures features ([
      (crates."rand_core"."${deps."rand_pcg"."0.1.2"."rand_core"}" deps)
    ]);

    buildDependencies = mapFeatures features ([
      (crates."autocfg"."${deps."rand_pcg"."0.1.2"."autocfg"}" deps)
    ]);
    features = mkFeatures (features."rand_pcg"."0.1.2" or {});
  };
  features_.rand_pcg."0.1.2" = deps: f: updateFeatures f (rec {
    autocfg."${deps.rand_pcg."0.1.2".autocfg}".default = true;
    rand_core."${deps.rand_pcg."0.1.2".rand_core}".default = true;
    rand_pcg = fold recursiveUpdate {} [
      { "0.1.2"."serde" =
        (f.rand_pcg."0.1.2"."serde" or false) ||
        (f.rand_pcg."0.1.2".serde1 or false) ||
        (rand_pcg."0.1.2"."serde1" or false); }
      { "0.1.2"."serde_derive" =
        (f.rand_pcg."0.1.2"."serde_derive" or false) ||
        (f.rand_pcg."0.1.2".serde1 or false) ||
        (rand_pcg."0.1.2"."serde1" or false); }
      { "0.1.2".default = (f.rand_pcg."0.1.2".default or true); }
    ];
  }) [
    (features_.rand_core."${deps."rand_pcg"."0.1.2"."rand_core"}" deps)
    (features_.autocfg."${deps."rand_pcg"."0.1.2"."autocfg"}" deps)
  ];


# end
# rand_xorshift-0.1.1

  crates.rand_xorshift."0.1.1" = deps: { features?(features_.rand_xorshift."0.1.1" deps {}) }: buildRustCrate {
    crateName = "rand_xorshift";
    version = "0.1.1";
    description = "Xorshift random number generator\n";
    authors = [ "The Rand Project Developers" "The Rust Project Developers" ];
    sha256 = "0v365c4h4lzxwz5k5kp9m0661s0sss7ylv74if0xb4svis9sswnn";
    dependencies = mapFeatures features ([
      (crates."rand_core"."${deps."rand_xorshift"."0.1.1"."rand_core"}" deps)
    ]);
    features = mkFeatures (features."rand_xorshift"."0.1.1" or {});
  };
  features_.rand_xorshift."0.1.1" = deps: f: updateFeatures f (rec {
    rand_core."${deps.rand_xorshift."0.1.1".rand_core}".default = (f.rand_core."${deps.rand_xorshift."0.1.1".rand_core}".default or false);
    rand_xorshift = fold recursiveUpdate {} [
      { "0.1.1"."serde" =
        (f.rand_xorshift."0.1.1"."serde" or false) ||
        (f.rand_xorshift."0.1.1".serde1 or false) ||
        (rand_xorshift."0.1.1"."serde1" or false); }
      { "0.1.1"."serde_derive" =
        (f.rand_xorshift."0.1.1"."serde_derive" or false) ||
        (f.rand_xorshift."0.1.1".serde1 or false) ||
        (rand_xorshift."0.1.1"."serde1" or false); }
      { "0.1.1".default = (f.rand_xorshift."0.1.1".default or true); }
    ];
  }) [
    (features_.rand_core."${deps."rand_xorshift"."0.1.1"."rand_core"}" deps)
  ];


# end
# rdrand-0.4.0

  crates.rdrand."0.4.0" = deps: { features?(features_.rdrand."0.4.0" deps {}) }: buildRustCrate {
    crateName = "rdrand";
    version = "0.4.0";
    description = "An implementation of random number generator based on rdrand and rdseed instructions";
    authors = [ "Simonas Kazlauskas <rdrand@kazlauskas.me>" ];
    sha256 = "15hrcasn0v876wpkwab1dwbk9kvqwrb3iv4y4dibb6yxnfvzwajk";
    dependencies = mapFeatures features ([
      (crates."rand_core"."${deps."rdrand"."0.4.0"."rand_core"}" deps)
    ]);
    features = mkFeatures (features."rdrand"."0.4.0" or {});
  };
  features_.rdrand."0.4.0" = deps: f: updateFeatures f (rec {
    rand_core."${deps.rdrand."0.4.0".rand_core}".default = (f.rand_core."${deps.rdrand."0.4.0".rand_core}".default or false);
    rdrand = fold recursiveUpdate {} [
      { "0.4.0"."std" =
        (f.rdrand."0.4.0"."std" or false) ||
        (f.rdrand."0.4.0".default or false) ||
        (rdrand."0.4.0"."default" or false); }
      { "0.4.0".default = (f.rdrand."0.4.0".default or true); }
    ];
  }) [
    (features_.rand_core."${deps."rdrand"."0.4.0"."rand_core"}" deps)
  ];


# end
# redox_syscall-0.1.53

  crates.redox_syscall."0.1.53" = deps: { features?(features_.redox_syscall."0.1.53" deps {}) }: buildRustCrate {
    crateName = "redox_syscall";
    version = "0.1.53";
    description = "A Rust library to access raw Redox system calls";
    authors = [ "Jeremy Soller <jackpot51@gmail.com>" ];
    sha256 = "1g7arnyxly8ji14am62w2pxib1rll908rcb4iw2w80yl1wyg2x9y";
    libName = "syscall";
  };
  features_.redox_syscall."0.1.53" = deps: f: updateFeatures f (rec {
    redox_syscall."0.1.53".default = (f.redox_syscall."0.1.53".default or true);
  }) [];


# end
# redox_users-0.3.0

  crates.redox_users."0.3.0" = deps: { features?(features_.redox_users."0.3.0" deps {}) }: buildRustCrate {
    crateName = "redox_users";
    version = "0.3.0";
    description = "A Rust library to access Redox users and groups functionality";
    authors = [ "Jose Narvaez <goyox86@gmail.com>" "Wesley Hershberger <mggmugginsmc@gmail.com>" ];
    sha256 = "051rzqgk5hn7rf24nwgbb32zfdn8qp2kwqvdp0772ia85p737p4j";
    dependencies = mapFeatures features ([
      (crates."argon2rs"."${deps."redox_users"."0.3.0"."argon2rs"}" deps)
      (crates."failure"."${deps."redox_users"."0.3.0"."failure"}" deps)
      (crates."rand_os"."${deps."redox_users"."0.3.0"."rand_os"}" deps)
      (crates."redox_syscall"."${deps."redox_users"."0.3.0"."redox_syscall"}" deps)
    ]);
  };
  features_.redox_users."0.3.0" = deps: f: updateFeatures f (rec {
    argon2rs."${deps.redox_users."0.3.0".argon2rs}".default = (f.argon2rs."${deps.redox_users."0.3.0".argon2rs}".default or false);
    failure."${deps.redox_users."0.3.0".failure}".default = true;
    rand_os."${deps.redox_users."0.3.0".rand_os}".default = true;
    redox_syscall."${deps.redox_users."0.3.0".redox_syscall}".default = true;
    redox_users."0.3.0".default = (f.redox_users."0.3.0".default or true);
  }) [
    (features_.argon2rs."${deps."redox_users"."0.3.0"."argon2rs"}" deps)
    (features_.failure."${deps."redox_users"."0.3.0"."failure"}" deps)
    (features_.rand_os."${deps."redox_users"."0.3.0"."rand_os"}" deps)
    (features_.redox_syscall."${deps."redox_users"."0.3.0"."redox_syscall"}" deps)
  ];


# end
# regex-0.2.11

  crates.regex."0.2.11" = deps: { features?(features_.regex."0.2.11" deps {}) }: buildRustCrate {
    crateName = "regex";
    version = "0.2.11";
    description = "An implementation of regular expressions for Rust. This implementation uses\nfinite automata and guarantees linear time matching on all inputs.\n";
    authors = [ "The Rust Project Developers" ];
    sha256 = "0r50cymxdqp0fv1dxd22mjr6y32q450nwacd279p9s7lh0cafijj";
    dependencies = mapFeatures features ([
      (crates."aho_corasick"."${deps."regex"."0.2.11"."aho_corasick"}" deps)
      (crates."memchr"."${deps."regex"."0.2.11"."memchr"}" deps)
      (crates."regex_syntax"."${deps."regex"."0.2.11"."regex_syntax"}" deps)
      (crates."thread_local"."${deps."regex"."0.2.11"."thread_local"}" deps)
      (crates."utf8_ranges"."${deps."regex"."0.2.11"."utf8_ranges"}" deps)
    ]);
    features = mkFeatures (features."regex"."0.2.11" or {});
  };
  features_.regex."0.2.11" = deps: f: updateFeatures f (rec {
    aho_corasick."${deps.regex."0.2.11".aho_corasick}".default = true;
    memchr."${deps.regex."0.2.11".memchr}".default = true;
    regex = fold recursiveUpdate {} [
      { "0.2.11"."pattern" =
        (f.regex."0.2.11"."pattern" or false) ||
        (f.regex."0.2.11".unstable or false) ||
        (regex."0.2.11"."unstable" or false); }
      { "0.2.11".default = (f.regex."0.2.11".default or true); }
    ];
    regex_syntax."${deps.regex."0.2.11".regex_syntax}".default = true;
    thread_local."${deps.regex."0.2.11".thread_local}".default = true;
    utf8_ranges."${deps.regex."0.2.11".utf8_ranges}".default = true;
  }) [
    (features_.aho_corasick."${deps."regex"."0.2.11"."aho_corasick"}" deps)
    (features_.memchr."${deps."regex"."0.2.11"."memchr"}" deps)
    (features_.regex_syntax."${deps."regex"."0.2.11"."regex_syntax"}" deps)
    (features_.thread_local."${deps."regex"."0.2.11"."thread_local"}" deps)
    (features_.utf8_ranges."${deps."regex"."0.2.11"."utf8_ranges"}" deps)
  ];


# end
# regex-1.1.5

  crates.regex."1.1.5" = deps: { features?(features_.regex."1.1.5" deps {}) }: buildRustCrate {
    crateName = "regex";
    version = "1.1.5";
    description = "An implementation of regular expressions for Rust. This implementation uses\nfinite automata and guarantees linear time matching on all inputs.\n";
    authors = [ "The Rust Project Developers" ];
    sha256 = "0r2y4pmg2089qfi65cgzx49zsw4ncrlxnhalq21gv3v73bz5i3j8";
    dependencies = mapFeatures features ([
      (crates."aho_corasick"."${deps."regex"."1.1.5"."aho_corasick"}" deps)
      (crates."memchr"."${deps."regex"."1.1.5"."memchr"}" deps)
      (crates."regex_syntax"."${deps."regex"."1.1.5"."regex_syntax"}" deps)
      (crates."thread_local"."${deps."regex"."1.1.5"."thread_local"}" deps)
      (crates."utf8_ranges"."${deps."regex"."1.1.5"."utf8_ranges"}" deps)
    ]);
    features = mkFeatures (features."regex"."1.1.5" or {});
  };
  features_.regex."1.1.5" = deps: f: updateFeatures f (rec {
    aho_corasick."${deps.regex."1.1.5".aho_corasick}".default = true;
    memchr."${deps.regex."1.1.5".memchr}".default = true;
    regex = fold recursiveUpdate {} [
      { "1.1.5"."pattern" =
        (f.regex."1.1.5"."pattern" or false) ||
        (f.regex."1.1.5".unstable or false) ||
        (regex."1.1.5"."unstable" or false); }
      { "1.1.5"."use_std" =
        (f.regex."1.1.5"."use_std" or false) ||
        (f.regex."1.1.5".default or false) ||
        (regex."1.1.5"."default" or false); }
      { "1.1.5".default = (f.regex."1.1.5".default or true); }
    ];
    regex_syntax."${deps.regex."1.1.5".regex_syntax}".default = true;
    thread_local."${deps.regex."1.1.5".thread_local}".default = true;
    utf8_ranges."${deps.regex."1.1.5".utf8_ranges}".default = true;
  }) [
    (features_.aho_corasick."${deps."regex"."1.1.5"."aho_corasick"}" deps)
    (features_.memchr."${deps."regex"."1.1.5"."memchr"}" deps)
    (features_.regex_syntax."${deps."regex"."1.1.5"."regex_syntax"}" deps)
    (features_.thread_local."${deps."regex"."1.1.5"."thread_local"}" deps)
    (features_.utf8_ranges."${deps."regex"."1.1.5"."utf8_ranges"}" deps)
  ];


# end
# regex-syntax-0.5.6

  crates.regex_syntax."0.5.6" = deps: { features?(features_.regex_syntax."0.5.6" deps {}) }: buildRustCrate {
    crateName = "regex-syntax";
    version = "0.5.6";
    description = "A regular expression parser.";
    authors = [ "The Rust Project Developers" ];
    sha256 = "10vf3r34bgjnbrnqd5aszn35bjvm8insw498l1vjy8zx5yms3427";
    dependencies = mapFeatures features ([
      (crates."ucd_util"."${deps."regex_syntax"."0.5.6"."ucd_util"}" deps)
    ]);
  };
  features_.regex_syntax."0.5.6" = deps: f: updateFeatures f (rec {
    regex_syntax."0.5.6".default = (f.regex_syntax."0.5.6".default or true);
    ucd_util."${deps.regex_syntax."0.5.6".ucd_util}".default = true;
  }) [
    (features_.ucd_util."${deps."regex_syntax"."0.5.6"."ucd_util"}" deps)
  ];


# end
# regex-syntax-0.6.6

  crates.regex_syntax."0.6.6" = deps: { features?(features_.regex_syntax."0.6.6" deps {}) }: buildRustCrate {
    crateName = "regex-syntax";
    version = "0.6.6";
    description = "A regular expression parser.";
    authors = [ "The Rust Project Developers" ];
    sha256 = "1cjrdc3affa3rjfaxkp91xnf9k0fsqn9z4xqc280vv39nvrl8p8b";
    dependencies = mapFeatures features ([
      (crates."ucd_util"."${deps."regex_syntax"."0.6.6"."ucd_util"}" deps)
    ]);
  };
  features_.regex_syntax."0.6.6" = deps: f: updateFeatures f (rec {
    regex_syntax."0.6.6".default = (f.regex_syntax."0.6.6".default or true);
    ucd_util."${deps.regex_syntax."0.6.6".ucd_util}".default = true;
  }) [
    (features_.ucd_util."${deps."regex_syntax"."0.6.6"."ucd_util"}" deps)
  ];


# end
# rpassword-3.0.1

  crates.rpassword."3.0.1" = deps: { features?(features_.rpassword."3.0.1" deps {}) }: buildRustCrate {
    crateName = "rpassword";
    version = "3.0.1";
    description = "Read passwords in console applications.";
    authors = [ "Conrad Kleinespel <conradk@conradk.com>" ];
    sha256 = "0rj5rr98ncp81c604bwjkmwjsr12ni4jp2lnx4261inghcmbr1x7";
    dependencies = (if (kernel == "linux" || kernel == "darwin") then mapFeatures features ([
      (crates."libc"."${deps."rpassword"."3.0.1"."libc"}" deps)
    ]) else [])
      ++ (if kernel == "windows" then mapFeatures features ([
      (crates."kernel32_sys"."${deps."rpassword"."3.0.1"."kernel32_sys"}" deps)
      (crates."winapi"."${deps."rpassword"."3.0.1"."winapi"}" deps)
    ]) else []);
  };
  features_.rpassword."3.0.1" = deps: f: updateFeatures f (rec {
    kernel32_sys."${deps.rpassword."3.0.1".kernel32_sys}".default = true;
    libc."${deps.rpassword."3.0.1".libc}".default = true;
    rpassword."3.0.1".default = (f.rpassword."3.0.1".default or true);
    winapi."${deps.rpassword."3.0.1".winapi}".default = true;
  }) [
    (features_.libc."${deps."rpassword"."3.0.1"."libc"}" deps)
    (features_.kernel32_sys."${deps."rpassword"."3.0.1"."kernel32_sys"}" deps)
    (features_.winapi."${deps."rpassword"."3.0.1"."winapi"}" deps)
  ];


# end
# rprompt-1.0.3

  crates.rprompt."1.0.3" = deps: { features?(features_.rprompt."1.0.3" deps {}) }: buildRustCrate {
    crateName = "rprompt";
    version = "1.0.3";
    description = "Prompt user input in console applications.";
    authors = [ "Conrad Kleinespel <conradk@conradk.com>" ];
    sha256 = "1j8nknqzsyzv3dzbwjkvcwp558hq2sczihkjgs5p6x21mysjjyvx";
  };
  features_.rprompt."1.0.3" = deps: f: updateFeatures f (rec {
    rprompt."1.0.3".default = (f.rprompt."1.0.3".default or true);
  }) [];


# end
# rustc-demangle-0.1.13

  crates.rustc_demangle."0.1.13" = deps: { features?(features_.rustc_demangle."0.1.13" deps {}) }: buildRustCrate {
    crateName = "rustc-demangle";
    version = "0.1.13";
    description = "Rust compiler symbol demangling.\n";
    authors = [ "Alex Crichton <alex@alexcrichton.com>" ];
    sha256 = "0sr6cr02araqnlqwc5ghvnafjmkw11vzjswqaz757lvyrcl8xcy6";
  };
  features_.rustc_demangle."0.1.13" = deps: f: updateFeatures f (rec {
    rustc_demangle."0.1.13".default = (f.rustc_demangle."0.1.13".default or true);
  }) [];


# end
# rustc_version-0.2.3

  crates.rustc_version."0.2.3" = deps: { features?(features_.rustc_version."0.2.3" deps {}) }: buildRustCrate {
    crateName = "rustc_version";
    version = "0.2.3";
    description = "A library for querying the version of a installed rustc compiler";
    authors = [ "Marvin Löbel <loebel.marvin@gmail.com>" ];
    sha256 = "0rgwzbgs3i9fqjm1p4ra3n7frafmpwl29c8lw85kv1rxn7n2zaa7";
    dependencies = mapFeatures features ([
      (crates."semver"."${deps."rustc_version"."0.2.3"."semver"}" deps)
    ]);
  };
  features_.rustc_version."0.2.3" = deps: f: updateFeatures f (rec {
    rustc_version."0.2.3".default = (f.rustc_version."0.2.3".default or true);
    semver."${deps.rustc_version."0.2.3".semver}".default = true;
  }) [
    (features_.semver."${deps."rustc_version"."0.2.3"."semver"}" deps)
  ];


# end
# ryu-0.2.7

  crates.ryu."0.2.7" = deps: { features?(features_.ryu."0.2.7" deps {}) }: buildRustCrate {
    crateName = "ryu";
    version = "0.2.7";
    description = "Fast floating point to string conversion";
    authors = [ "David Tolnay <dtolnay@gmail.com>" ];
    sha256 = "0m8szf1m87wfqkwh1f9zp9bn2mb0m9nav028xxnd0hlig90b44bd";
    build = "build.rs";
    dependencies = mapFeatures features ([
]);
    features = mkFeatures (features."ryu"."0.2.7" or {});
  };
  features_.ryu."0.2.7" = deps: f: updateFeatures f (rec {
    ryu."0.2.7".default = (f.ryu."0.2.7".default or true);
  }) [];


# end
# scoped_threadpool-0.1.9

  crates.scoped_threadpool."0.1.9" = deps: { features?(features_.scoped_threadpool."0.1.9" deps {}) }: buildRustCrate {
    crateName = "scoped_threadpool";
    version = "0.1.9";
    description = "A library for scoped and cached threadpools.";
    authors = [ "Marvin Löbel <loebel.marvin@gmail.com>" ];
    sha256 = "1arqj2skcfr46s1lcyvnlmfr5456kg5nhn8k90xyfjnxkp5yga2v";
    features = mkFeatures (features."scoped_threadpool"."0.1.9" or {});
  };
  features_.scoped_threadpool."0.1.9" = deps: f: updateFeatures f (rec {
    scoped_threadpool."0.1.9".default = (f.scoped_threadpool."0.1.9".default or true);
  }) [];


# end
# semver-0.9.0

  crates.semver."0.9.0" = deps: { features?(features_.semver."0.9.0" deps {}) }: buildRustCrate {
    crateName = "semver";
    version = "0.9.0";
    description = "Semantic version parsing and comparison.\n";
    authors = [ "Steve Klabnik <steve@steveklabnik.com>" "The Rust Project Developers" ];
    sha256 = "0azak2lb2wc36s3x15az886kck7rpnksrw14lalm157rg9sc9z63";
    dependencies = mapFeatures features ([
      (crates."semver_parser"."${deps."semver"."0.9.0"."semver_parser"}" deps)
    ]);
    features = mkFeatures (features."semver"."0.9.0" or {});
  };
  features_.semver."0.9.0" = deps: f: updateFeatures f (rec {
    semver = fold recursiveUpdate {} [
      { "0.9.0"."serde" =
        (f.semver."0.9.0"."serde" or false) ||
        (f.semver."0.9.0".ci or false) ||
        (semver."0.9.0"."ci" or false); }
      { "0.9.0".default = (f.semver."0.9.0".default or true); }
    ];
    semver_parser."${deps.semver."0.9.0".semver_parser}".default = true;
  }) [
    (features_.semver_parser."${deps."semver"."0.9.0"."semver_parser"}" deps)
  ];


# end
# semver-parser-0.7.0

  crates.semver_parser."0.7.0" = deps: { features?(features_.semver_parser."0.7.0" deps {}) }: buildRustCrate {
    crateName = "semver-parser";
    version = "0.7.0";
    description = "Parsing of the semver spec.\n";
    authors = [ "Steve Klabnik <steve@steveklabnik.com>" ];
    sha256 = "1da66c8413yakx0y15k8c055yna5lyb6fr0fw9318kdwkrk5k12h";
  };
  features_.semver_parser."0.7.0" = deps: f: updateFeatures f (rec {
    semver_parser."0.7.0".default = (f.semver_parser."0.7.0".default or true);
  }) [];


# end
# serde-1.0.90

  crates.serde."1.0.90" = deps: { features?(features_.serde."1.0.90" deps {}) }: buildRustCrate {
    crateName = "serde";
    version = "1.0.90";
    description = "A generic serialization/deserialization framework";
    authors = [ "Erick Tryzelaar <erick.tryzelaar@gmail.com>" "David Tolnay <dtolnay@gmail.com>" ];
    sha256 = "10b6n74m1dvb667vrn1db47ncb4h0mkqbg1dsamqjvv5vl5b5j56";
    build = "build.rs";
    dependencies = mapFeatures features ([
]);
    features = mkFeatures (features."serde"."1.0.90" or {});
  };
  features_.serde."1.0.90" = deps: f: updateFeatures f (rec {
    serde = fold recursiveUpdate {} [
      { "1.0.90"."serde_derive" =
        (f.serde."1.0.90"."serde_derive" or false) ||
        (f.serde."1.0.90".derive or false) ||
        (serde."1.0.90"."derive" or false); }
      { "1.0.90"."std" =
        (f.serde."1.0.90"."std" or false) ||
        (f.serde."1.0.90".default or false) ||
        (serde."1.0.90"."default" or false); }
      { "1.0.90"."unstable" =
        (f.serde."1.0.90"."unstable" or false) ||
        (f.serde."1.0.90".alloc or false) ||
        (serde."1.0.90"."alloc" or false); }
      { "1.0.90".default = (f.serde."1.0.90".default or true); }
    ];
  }) [];


# end
# serde_derive-1.0.90

  crates.serde_derive."1.0.90" = deps: { features?(features_.serde_derive."1.0.90" deps {}) }: buildRustCrate {
    crateName = "serde_derive";
    version = "1.0.90";
    description = "Macros 1.1 implementation of #[derive(Serialize, Deserialize)]";
    authors = [ "Erick Tryzelaar <erick.tryzelaar@gmail.com>" "David Tolnay <dtolnay@gmail.com>" ];
    sha256 = "1m4xgyl8jj3mxj0wszminzc1qf2gbkj9dpl17vi95nwl6m7i157y";
    procMacro = true;
    dependencies = mapFeatures features ([
      (crates."proc_macro2"."${deps."serde_derive"."1.0.90"."proc_macro2"}" deps)
      (crates."quote"."${deps."serde_derive"."1.0.90"."quote"}" deps)
      (crates."syn"."${deps."serde_derive"."1.0.90"."syn"}" deps)
    ]);
    features = mkFeatures (features."serde_derive"."1.0.90" or {});
  };
  features_.serde_derive."1.0.90" = deps: f: updateFeatures f (rec {
    proc_macro2."${deps.serde_derive."1.0.90".proc_macro2}".default = true;
    quote."${deps.serde_derive."1.0.90".quote}".default = true;
    serde_derive."1.0.90".default = (f.serde_derive."1.0.90".default or true);
    syn = fold recursiveUpdate {} [
      { "${deps.serde_derive."1.0.90".syn}"."visit" = true; }
      { "${deps.serde_derive."1.0.90".syn}".default = true; }
    ];
  }) [
    (features_.proc_macro2."${deps."serde_derive"."1.0.90"."proc_macro2"}" deps)
    (features_.quote."${deps."serde_derive"."1.0.90"."quote"}" deps)
    (features_.syn."${deps."serde_derive"."1.0.90"."syn"}" deps)
  ];


# end
# serde_json-1.0.39

  crates.serde_json."1.0.39" = deps: { features?(features_.serde_json."1.0.39" deps {}) }: buildRustCrate {
    crateName = "serde_json";
    version = "1.0.39";
    description = "A JSON serialization file format";
    authors = [ "Erick Tryzelaar <erick.tryzelaar@gmail.com>" "David Tolnay <dtolnay@gmail.com>" ];
    sha256 = "07ydv06hn8x0yl0rc94l2wl9r2xz1fqd97n1s6j3bgdc6gw406a8";
    dependencies = mapFeatures features ([
      (crates."itoa"."${deps."serde_json"."1.0.39"."itoa"}" deps)
      (crates."ryu"."${deps."serde_json"."1.0.39"."ryu"}" deps)
      (crates."serde"."${deps."serde_json"."1.0.39"."serde"}" deps)
    ]);
    features = mkFeatures (features."serde_json"."1.0.39" or {});
  };
  features_.serde_json."1.0.39" = deps: f: updateFeatures f (rec {
    itoa."${deps.serde_json."1.0.39".itoa}".default = true;
    ryu."${deps.serde_json."1.0.39".ryu}".default = true;
    serde."${deps.serde_json."1.0.39".serde}".default = true;
    serde_json = fold recursiveUpdate {} [
      { "1.0.39"."indexmap" =
        (f.serde_json."1.0.39"."indexmap" or false) ||
        (f.serde_json."1.0.39".preserve_order or false) ||
        (serde_json."1.0.39"."preserve_order" or false); }
      { "1.0.39".default = (f.serde_json."1.0.39".default or true); }
    ];
  }) [
    (features_.itoa."${deps."serde_json"."1.0.39"."itoa"}" deps)
    (features_.ryu."${deps."serde_json"."1.0.39"."ryu"}" deps)
    (features_.serde."${deps."serde_json"."1.0.39"."serde"}" deps)
  ];


# end
# syn-0.11.11

  crates.syn."0.11.11" = deps: { features?(features_.syn."0.11.11" deps {}) }: buildRustCrate {
    crateName = "syn";
    version = "0.11.11";
    description = "Nom parser for Rust source code";
    authors = [ "David Tolnay <dtolnay@gmail.com>" ];
    sha256 = "0yw8ng7x1dn5a6ykg0ib49y7r9nhzgpiq2989rqdp7rdz3n85502";
    dependencies = mapFeatures features ([
    ]
      ++ (if features.syn."0.11.11".quote or false then [ (crates.quote."${deps."syn"."0.11.11".quote}" deps) ] else [])
      ++ (if features.syn."0.11.11".synom or false then [ (crates.synom."${deps."syn"."0.11.11".synom}" deps) ] else [])
      ++ (if features.syn."0.11.11".unicode-xid or false then [ (crates.unicode_xid."${deps."syn"."0.11.11".unicode_xid}" deps) ] else []));
    features = mkFeatures (features."syn"."0.11.11" or {});
  };
  features_.syn."0.11.11" = deps: f: updateFeatures f (rec {
    quote."${deps.syn."0.11.11".quote}".default = true;
    syn = fold recursiveUpdate {} [
      { "0.11.11"."parsing" =
        (f.syn."0.11.11"."parsing" or false) ||
        (f.syn."0.11.11".default or false) ||
        (syn."0.11.11"."default" or false); }
      { "0.11.11"."printing" =
        (f.syn."0.11.11"."printing" or false) ||
        (f.syn."0.11.11".default or false) ||
        (syn."0.11.11"."default" or false); }
      { "0.11.11"."quote" =
        (f.syn."0.11.11"."quote" or false) ||
        (f.syn."0.11.11".printing or false) ||
        (syn."0.11.11"."printing" or false); }
      { "0.11.11"."synom" =
        (f.syn."0.11.11"."synom" or false) ||
        (f.syn."0.11.11".parsing or false) ||
        (syn."0.11.11"."parsing" or false); }
      { "0.11.11"."unicode-xid" =
        (f.syn."0.11.11"."unicode-xid" or false) ||
        (f.syn."0.11.11".parsing or false) ||
        (syn."0.11.11"."parsing" or false); }
      { "0.11.11".default = (f.syn."0.11.11".default or true); }
    ];
    synom."${deps.syn."0.11.11".synom}".default = true;
    unicode_xid."${deps.syn."0.11.11".unicode_xid}".default = true;
  }) [
    (features_.quote."${deps."syn"."0.11.11"."quote"}" deps)
    (features_.synom."${deps."syn"."0.11.11"."synom"}" deps)
    (features_.unicode_xid."${deps."syn"."0.11.11"."unicode_xid"}" deps)
  ];


# end
# syn-0.15.30

  crates.syn."0.15.30" = deps: { features?(features_.syn."0.15.30" deps {}) }: buildRustCrate {
    crateName = "syn";
    version = "0.15.30";
    description = "Parser for Rust source code";
    authors = [ "David Tolnay <dtolnay@gmail.com>" ];
    sha256 = "0rdjg37f7h1yqwmzqji4ll82xzzxv8k6vrf55p53c8dl49vqlgnx";
    dependencies = mapFeatures features ([
      (crates."proc_macro2"."${deps."syn"."0.15.30"."proc_macro2"}" deps)
      (crates."unicode_xid"."${deps."syn"."0.15.30"."unicode_xid"}" deps)
    ]
      ++ (if features.syn."0.15.30".quote or false then [ (crates.quote."${deps."syn"."0.15.30".quote}" deps) ] else []));
    features = mkFeatures (features."syn"."0.15.30" or {});
  };
  features_.syn."0.15.30" = deps: f: updateFeatures f (rec {
    proc_macro2 = fold recursiveUpdate {} [
      { "${deps.syn."0.15.30".proc_macro2}"."proc-macro" =
        (f.proc_macro2."${deps.syn."0.15.30".proc_macro2}"."proc-macro" or false) ||
        (syn."0.15.30"."proc-macro" or false) ||
        (f."syn"."0.15.30"."proc-macro" or false); }
      { "${deps.syn."0.15.30".proc_macro2}".default = (f.proc_macro2."${deps.syn."0.15.30".proc_macro2}".default or false); }
    ];
    quote = fold recursiveUpdate {} [
      { "${deps.syn."0.15.30".quote}"."proc-macro" =
        (f.quote."${deps.syn."0.15.30".quote}"."proc-macro" or false) ||
        (syn."0.15.30"."proc-macro" or false) ||
        (f."syn"."0.15.30"."proc-macro" or false); }
      { "${deps.syn."0.15.30".quote}".default = (f.quote."${deps.syn."0.15.30".quote}".default or false); }
    ];
    syn = fold recursiveUpdate {} [
      { "0.15.30"."clone-impls" =
        (f.syn."0.15.30"."clone-impls" or false) ||
        (f.syn."0.15.30".default or false) ||
        (syn."0.15.30"."default" or false); }
      { "0.15.30"."derive" =
        (f.syn."0.15.30"."derive" or false) ||
        (f.syn."0.15.30".default or false) ||
        (syn."0.15.30"."default" or false); }
      { "0.15.30"."parsing" =
        (f.syn."0.15.30"."parsing" or false) ||
        (f.syn."0.15.30".default or false) ||
        (syn."0.15.30"."default" or false); }
      { "0.15.30"."printing" =
        (f.syn."0.15.30"."printing" or false) ||
        (f.syn."0.15.30".default or false) ||
        (syn."0.15.30"."default" or false); }
      { "0.15.30"."proc-macro" =
        (f.syn."0.15.30"."proc-macro" or false) ||
        (f.syn."0.15.30".default or false) ||
        (syn."0.15.30"."default" or false); }
      { "0.15.30"."quote" =
        (f.syn."0.15.30"."quote" or false) ||
        (f.syn."0.15.30".printing or false) ||
        (syn."0.15.30"."printing" or false); }
      { "0.15.30".default = (f.syn."0.15.30".default or true); }
    ];
    unicode_xid."${deps.syn."0.15.30".unicode_xid}".default = true;
  }) [
    (features_.proc_macro2."${deps."syn"."0.15.30"."proc_macro2"}" deps)
    (features_.quote."${deps."syn"."0.15.30"."quote"}" deps)
    (features_.unicode_xid."${deps."syn"."0.15.30"."unicode_xid"}" deps)
  ];


# end
# synom-0.11.3

  crates.synom."0.11.3" = deps: { features?(features_.synom."0.11.3" deps {}) }: buildRustCrate {
    crateName = "synom";
    version = "0.11.3";
    description = "Stripped-down Nom parser used by Syn";
    authors = [ "David Tolnay <dtolnay@gmail.com>" ];
    sha256 = "1l6d1s9qjfp6ng2s2z8219igvlv7gyk8gby97sdykqc1r93d8rhc";
    dependencies = mapFeatures features ([
      (crates."unicode_xid"."${deps."synom"."0.11.3"."unicode_xid"}" deps)
    ]);
  };
  features_.synom."0.11.3" = deps: f: updateFeatures f (rec {
    synom."0.11.3".default = (f.synom."0.11.3".default or true);
    unicode_xid."${deps.synom."0.11.3".unicode_xid}".default = true;
  }) [
    (features_.unicode_xid."${deps."synom"."0.11.3"."unicode_xid"}" deps)
  ];


# end
# synstructure-0.10.1

  crates.synstructure."0.10.1" = deps: { features?(features_.synstructure."0.10.1" deps {}) }: buildRustCrate {
    crateName = "synstructure";
    version = "0.10.1";
    description = "Helper methods and macros for custom derives";
    authors = [ "Nika Layzell <nika@thelayzells.com>" ];
    sha256 = "0mx2vwd0d0f7hanz15nkp0ikkfjsx9rfkph7pynxyfbj45ank4g3";
    dependencies = mapFeatures features ([
      (crates."proc_macro2"."${deps."synstructure"."0.10.1"."proc_macro2"}" deps)
      (crates."quote"."${deps."synstructure"."0.10.1"."quote"}" deps)
      (crates."syn"."${deps."synstructure"."0.10.1"."syn"}" deps)
      (crates."unicode_xid"."${deps."synstructure"."0.10.1"."unicode_xid"}" deps)
    ]);
    features = mkFeatures (features."synstructure"."0.10.1" or {});
  };
  features_.synstructure."0.10.1" = deps: f: updateFeatures f (rec {
    proc_macro2."${deps.synstructure."0.10.1".proc_macro2}".default = true;
    quote."${deps.synstructure."0.10.1".quote}".default = true;
    syn = fold recursiveUpdate {} [
      { "${deps.synstructure."0.10.1".syn}"."extra-traits" = true; }
      { "${deps.synstructure."0.10.1".syn}"."visit" = true; }
      { "${deps.synstructure."0.10.1".syn}".default = true; }
    ];
    synstructure."0.10.1".default = (f.synstructure."0.10.1".default or true);
    unicode_xid."${deps.synstructure."0.10.1".unicode_xid}".default = true;
  }) [
    (features_.proc_macro2."${deps."synstructure"."0.10.1"."proc_macro2"}" deps)
    (features_.quote."${deps."synstructure"."0.10.1"."quote"}" deps)
    (features_.syn."${deps."synstructure"."0.10.1"."syn"}" deps)
    (features_.unicode_xid."${deps."synstructure"."0.10.1"."unicode_xid"}" deps)
  ];


# end
# thread_local-0.3.6

  crates.thread_local."0.3.6" = deps: { features?(features_.thread_local."0.3.6" deps {}) }: buildRustCrate {
    crateName = "thread_local";
    version = "0.3.6";
    description = "Per-object thread-local storage";
    authors = [ "Amanieu d'Antras <amanieu@gmail.com>" ];
    sha256 = "02rksdwjmz2pw9bmgbb4c0bgkbq5z6nvg510sq1s6y2j1gam0c7i";
    dependencies = mapFeatures features ([
      (crates."lazy_static"."${deps."thread_local"."0.3.6"."lazy_static"}" deps)
    ]);
  };
  features_.thread_local."0.3.6" = deps: f: updateFeatures f (rec {
    lazy_static."${deps.thread_local."0.3.6".lazy_static}".default = true;
    thread_local."0.3.6".default = (f.thread_local."0.3.6".default or true);
  }) [
    (features_.lazy_static."${deps."thread_local"."0.3.6"."lazy_static"}" deps)
  ];


# end
# time-0.1.42

  crates.time."0.1.42" = deps: { features?(features_.time."0.1.42" deps {}) }: buildRustCrate {
    crateName = "time";
    version = "0.1.42";
    description = "Utilities for working with time-related functions in Rust.\n";
    authors = [ "The Rust Project Developers" ];
    sha256 = "1ny809kmdjwd4b478ipc33dz7q6nq7rxk766x8cnrg6zygcksmmx";
    dependencies = mapFeatures features ([
      (crates."libc"."${deps."time"."0.1.42"."libc"}" deps)
    ])
      ++ (if kernel == "redox" then mapFeatures features ([
      (crates."redox_syscall"."${deps."time"."0.1.42"."redox_syscall"}" deps)
    ]) else [])
      ++ (if kernel == "windows" then mapFeatures features ([
      (crates."winapi"."${deps."time"."0.1.42"."winapi"}" deps)
    ]) else []);
  };
  features_.time."0.1.42" = deps: f: updateFeatures f (rec {
    libc."${deps.time."0.1.42".libc}".default = true;
    redox_syscall."${deps.time."0.1.42".redox_syscall}".default = true;
    time."0.1.42".default = (f.time."0.1.42".default or true);
    winapi = fold recursiveUpdate {} [
      { "${deps.time."0.1.42".winapi}"."minwinbase" = true; }
      { "${deps.time."0.1.42".winapi}"."minwindef" = true; }
      { "${deps.time."0.1.42".winapi}"."ntdef" = true; }
      { "${deps.time."0.1.42".winapi}"."profileapi" = true; }
      { "${deps.time."0.1.42".winapi}"."std" = true; }
      { "${deps.time."0.1.42".winapi}"."sysinfoapi" = true; }
      { "${deps.time."0.1.42".winapi}"."timezoneapi" = true; }
      { "${deps.time."0.1.42".winapi}".default = true; }
    ];
  }) [
    (features_.libc."${deps."time"."0.1.42"."libc"}" deps)
    (features_.redox_syscall."${deps."time"."0.1.42"."redox_syscall"}" deps)
    (features_.winapi."${deps."time"."0.1.42"."winapi"}" deps)
  ];


# end
# ucd-util-0.1.3

  crates.ucd_util."0.1.3" = deps: { features?(features_.ucd_util."0.1.3" deps {}) }: buildRustCrate {
    crateName = "ucd-util";
    version = "0.1.3";
    description = "A small utility library for working with the Unicode character database.\n";
    authors = [ "Andrew Gallant <jamslam@gmail.com>" ];
    sha256 = "1n1qi3jywq5syq90z9qd8qzbn58pcjgv1sx4sdmipm4jf9zanz15";
  };
  features_.ucd_util."0.1.3" = deps: f: updateFeatures f (rec {
    ucd_util."0.1.3".default = (f.ucd_util."0.1.3".default or true);
  }) [];


# end
# unicode-width-0.1.5

  crates.unicode_width."0.1.5" = deps: { features?(features_.unicode_width."0.1.5" deps {}) }: buildRustCrate {
    crateName = "unicode-width";
    version = "0.1.5";
    description = "Determine displayed width of `char` and `str` types\naccording to Unicode Standard Annex #11 rules.\n";
    authors = [ "kwantam <kwantam@gmail.com>" ];
    sha256 = "0886lc2aymwgy0lhavwn6s48ik3c61ykzzd3za6prgnw51j7bi4w";
    features = mkFeatures (features."unicode_width"."0.1.5" or {});
  };
  features_.unicode_width."0.1.5" = deps: f: updateFeatures f (rec {
    unicode_width."0.1.5".default = (f.unicode_width."0.1.5".default or true);
  }) [];


# end
# unicode-xid-0.0.4

  crates.unicode_xid."0.0.4" = deps: { features?(features_.unicode_xid."0.0.4" deps {}) }: buildRustCrate {
    crateName = "unicode-xid";
    version = "0.0.4";
    description = "Determine whether characters have the XID_Start\nor XID_Continue properties according to\nUnicode Standard Annex #31.\n";
    authors = [ "erick.tryzelaar <erick.tryzelaar@gmail.com>" "kwantam <kwantam@gmail.com>" ];
    sha256 = "1dc8wkkcd3s6534s5aw4lbjn8m67flkkbnajp5bl8408wdg8rh9v";
    features = mkFeatures (features."unicode_xid"."0.0.4" or {});
  };
  features_.unicode_xid."0.0.4" = deps: f: updateFeatures f (rec {
    unicode_xid."0.0.4".default = (f.unicode_xid."0.0.4".default or true);
  }) [];


# end
# unicode-xid-0.1.0

  crates.unicode_xid."0.1.0" = deps: { features?(features_.unicode_xid."0.1.0" deps {}) }: buildRustCrate {
    crateName = "unicode-xid";
    version = "0.1.0";
    description = "Determine whether characters have the XID_Start\nor XID_Continue properties according to\nUnicode Standard Annex #31.\n";
    authors = [ "erick.tryzelaar <erick.tryzelaar@gmail.com>" "kwantam <kwantam@gmail.com>" ];
    sha256 = "05wdmwlfzxhq3nhsxn6wx4q8dhxzzfb9szsz6wiw092m1rjj01zj";
    features = mkFeatures (features."unicode_xid"."0.1.0" or {});
  };
  features_.unicode_xid."0.1.0" = deps: f: updateFeatures f (rec {
    unicode_xid."0.1.0".default = (f.unicode_xid."0.1.0".default or true);
  }) [];


# end
# utf8-ranges-1.0.2

  crates.utf8_ranges."1.0.2" = deps: { features?(features_.utf8_ranges."1.0.2" deps {}) }: buildRustCrate {
    crateName = "utf8-ranges";
    version = "1.0.2";
    description = "Convert ranges of Unicode codepoints to UTF-8 byte ranges.";
    authors = [ "Andrew Gallant <jamslam@gmail.com>" ];
    sha256 = "1my02laqsgnd8ib4dvjgd4rilprqjad6pb9jj9vi67csi5qs2281";
  };
  features_.utf8_ranges."1.0.2" = deps: f: updateFeatures f (rec {
    utf8_ranges."1.0.2".default = (f.utf8_ranges."1.0.2".default or true);
  }) [];


# end
# vcpkg-0.2.6

  crates.vcpkg."0.2.6" = deps: { features?(features_.vcpkg."0.2.6" deps {}) }: buildRustCrate {
    crateName = "vcpkg";
    version = "0.2.6";
    description = "A library to find native dependencies in a vcpkg tree at build\ntime in order to be used in Cargo build scripts.\n";
    authors = [ "Jim McGrath <jimmc2@gmail.com>" ];
    sha256 = "1ig6jqpzzl1z9vk4qywgpfr4hfbd8ny8frqsgm3r449wkc4n1i5x";
  };
  features_.vcpkg."0.2.6" = deps: f: updateFeatures f (rec {
    vcpkg."0.2.6".default = (f.vcpkg."0.2.6".default or true);
  }) [];


# end
# winapi-0.2.8

  crates.winapi."0.2.8" = deps: { features?(features_.winapi."0.2.8" deps {}) }: buildRustCrate {
    crateName = "winapi";
    version = "0.2.8";
    description = "Types and constants for WinAPI bindings. See README for list of crates providing function bindings.";
    authors = [ "Peter Atashian <retep998@gmail.com>" ];
    sha256 = "0a45b58ywf12vb7gvj6h3j264nydynmzyqz8d8rqxsj6icqv82as";
  };
  features_.winapi."0.2.8" = deps: f: updateFeatures f (rec {
    winapi."0.2.8".default = (f.winapi."0.2.8".default or true);
  }) [];


# end
# winapi-0.3.7

  crates.winapi."0.3.7" = deps: { features?(features_.winapi."0.3.7" deps {}) }: buildRustCrate {
    crateName = "winapi";
    version = "0.3.7";
    description = "Raw FFI bindings for all of Windows API.";
    authors = [ "Peter Atashian <retep998@gmail.com>" ];
    sha256 = "1k51gfkp0zqw7nj07y443mscs46icmdhld442s2073niap0kkdr8";
    build = "build.rs";
    dependencies = (if kernel == "i686-pc-windows-gnu" then mapFeatures features ([
      (crates."winapi_i686_pc_windows_gnu"."${deps."winapi"."0.3.7"."winapi_i686_pc_windows_gnu"}" deps)
    ]) else [])
      ++ (if kernel == "x86_64-pc-windows-gnu" then mapFeatures features ([
      (crates."winapi_x86_64_pc_windows_gnu"."${deps."winapi"."0.3.7"."winapi_x86_64_pc_windows_gnu"}" deps)
    ]) else []);
    features = mkFeatures (features."winapi"."0.3.7" or {});
  };
  features_.winapi."0.3.7" = deps: f: updateFeatures f (rec {
    winapi = fold recursiveUpdate {} [
      { "0.3.7"."impl-debug" =
        (f.winapi."0.3.7"."impl-debug" or false) ||
        (f.winapi."0.3.7".debug or false) ||
        (winapi."0.3.7"."debug" or false); }
      { "0.3.7".default = (f.winapi."0.3.7".default or true); }
    ];
    winapi_i686_pc_windows_gnu."${deps.winapi."0.3.7".winapi_i686_pc_windows_gnu}".default = true;
    winapi_x86_64_pc_windows_gnu."${deps.winapi."0.3.7".winapi_x86_64_pc_windows_gnu}".default = true;
  }) [
    (features_.winapi_i686_pc_windows_gnu."${deps."winapi"."0.3.7"."winapi_i686_pc_windows_gnu"}" deps)
    (features_.winapi_x86_64_pc_windows_gnu."${deps."winapi"."0.3.7"."winapi_x86_64_pc_windows_gnu"}" deps)
  ];


# end
# winapi-build-0.1.1

  crates.winapi_build."0.1.1" = deps: { features?(features_.winapi_build."0.1.1" deps {}) }: buildRustCrate {
    crateName = "winapi-build";
    version = "0.1.1";
    description = "Common code for build.rs in WinAPI -sys crates.";
    authors = [ "Peter Atashian <retep998@gmail.com>" ];
    sha256 = "1lxlpi87rkhxcwp2ykf1ldw3p108hwm24nywf3jfrvmff4rjhqga";
    libName = "build";
  };
  features_.winapi_build."0.1.1" = deps: f: updateFeatures f (rec {
    winapi_build."0.1.1".default = (f.winapi_build."0.1.1".default or true);
  }) [];


# end
# winapi-i686-pc-windows-gnu-0.4.0

  crates.winapi_i686_pc_windows_gnu."0.4.0" = deps: { features?(features_.winapi_i686_pc_windows_gnu."0.4.0" deps {}) }: buildRustCrate {
    crateName = "winapi-i686-pc-windows-gnu";
    version = "0.4.0";
    description = "Import libraries for the i686-pc-windows-gnu target. Please don't use this crate directly, depend on winapi instead.";
    authors = [ "Peter Atashian <retep998@gmail.com>" ];
    sha256 = "05ihkij18r4gamjpxj4gra24514can762imjzlmak5wlzidplzrp";
    build = "build.rs";
  };
  features_.winapi_i686_pc_windows_gnu."0.4.0" = deps: f: updateFeatures f (rec {
    winapi_i686_pc_windows_gnu."0.4.0".default = (f.winapi_i686_pc_windows_gnu."0.4.0".default or true);
  }) [];


# end
# winapi-x86_64-pc-windows-gnu-0.4.0

  crates.winapi_x86_64_pc_windows_gnu."0.4.0" = deps: { features?(features_.winapi_x86_64_pc_windows_gnu."0.4.0" deps {}) }: buildRustCrate {
    crateName = "winapi-x86_64-pc-windows-gnu";
    version = "0.4.0";
    description = "Import libraries for the x86_64-pc-windows-gnu target. Please don't use this crate directly, depend on winapi instead.";
    authors = [ "Peter Atashian <retep998@gmail.com>" ];
    sha256 = "0n1ylmlsb8yg1v583i4xy0qmqg42275flvbc51hdqjjfjcl9vlbj";
    build = "build.rs";
  };
  features_.winapi_x86_64_pc_windows_gnu."0.4.0" = deps: f: updateFeatures f (rec {
    winapi_x86_64_pc_windows_gnu."0.4.0".default = (f.winapi_x86_64_pc_windows_gnu."0.4.0".default or true);
  }) [];


# end
# x11-clipboard-0.3.1

  crates.x11_clipboard."0.3.1" = deps: { features?(features_.x11_clipboard."0.3.1" deps {}) }: buildRustCrate {
    crateName = "x11-clipboard";
    version = "0.3.1";
    description = "x11 clipboard support for Rust.";
    authors = [ "quininer kel <quininer@live.com>" ];
    sha256 = "1xcjwha5bz7r85bgnqv6dfsr8750wlffpkivsszjkjvw4p44l046";
    dependencies = mapFeatures features ([
      (crates."xcb"."${deps."x11_clipboard"."0.3.1"."xcb"}" deps)
    ]);
  };
  features_.x11_clipboard."0.3.1" = deps: f: updateFeatures f (rec {
    x11_clipboard."0.3.1".default = (f.x11_clipboard."0.3.1".default or true);
    xcb = fold recursiveUpdate {} [
      { "${deps.x11_clipboard."0.3.1".xcb}"."thread" = true; }
      { "${deps.x11_clipboard."0.3.1".xcb}"."xfixes" = true; }
      { "${deps.x11_clipboard."0.3.1".xcb}".default = true; }
    ];
  }) [
    (features_.xcb."${deps."x11_clipboard"."0.3.1"."xcb"}" deps)
  ];


# end
# xcb-0.8.2

  crates.xcb."0.8.2" = deps: { features?(features_.xcb."0.8.2" deps {}) }: buildRustCrate {
    crateName = "xcb";
    version = "0.8.2";
    description = "Rust bindings and wrappers for XCB";
    authors = [ "Remi Thebault <remi.thebault@gmail.com>" ];
    sha256 = "06l8jms57wvz01vx82a3cwak9b9qwdkadvpmkk1zimy2qg7i7dkl";
    build = "build.rs";
    dependencies = mapFeatures features ([
      (crates."libc"."${deps."xcb"."0.8.2"."libc"}" deps)
      (crates."log"."${deps."xcb"."0.8.2"."log"}" deps)
    ]);

    buildDependencies = mapFeatures features ([
      (crates."libc"."${deps."xcb"."0.8.2"."libc"}" deps)
    ]);
    features = mkFeatures (features."xcb"."0.8.2" or {});
  };
  features_.xcb."0.8.2" = deps: f: updateFeatures f (rec {
    libc."${deps.xcb."0.8.2".libc}".default = true;
    log."${deps.xcb."0.8.2".log}".default = true;
    xcb = fold recursiveUpdate {} [
      { "0.8.2"."composite" =
        (f.xcb."0.8.2"."composite" or false) ||
        (f.xcb."0.8.2".debug_all or false) ||
        (xcb."0.8.2"."debug_all" or false); }
      { "0.8.2"."damage" =
        (f.xcb."0.8.2"."damage" or false) ||
        (f.xcb."0.8.2".debug_all or false) ||
        (xcb."0.8.2"."debug_all" or false); }
      { "0.8.2"."dpms" =
        (f.xcb."0.8.2"."dpms" or false) ||
        (f.xcb."0.8.2".debug_all or false) ||
        (xcb."0.8.2"."debug_all" or false); }
      { "0.8.2"."dri2" =
        (f.xcb."0.8.2"."dri2" or false) ||
        (f.xcb."0.8.2".debug_all or false) ||
        (xcb."0.8.2"."debug_all" or false); }
      { "0.8.2"."dri3" =
        (f.xcb."0.8.2"."dri3" or false) ||
        (f.xcb."0.8.2".debug_all or false) ||
        (xcb."0.8.2"."debug_all" or false); }
      { "0.8.2"."glx" =
        (f.xcb."0.8.2"."glx" or false) ||
        (f.xcb."0.8.2".debug_all or false) ||
        (xcb."0.8.2"."debug_all" or false); }
      { "0.8.2"."randr" =
        (f.xcb."0.8.2"."randr" or false) ||
        (f.xcb."0.8.2".debug_all or false) ||
        (xcb."0.8.2"."debug_all" or false); }
      { "0.8.2"."record" =
        (f.xcb."0.8.2"."record" or false) ||
        (f.xcb."0.8.2".debug_all or false) ||
        (xcb."0.8.2"."debug_all" or false); }
      { "0.8.2"."render" =
        (f.xcb."0.8.2"."render" or false) ||
        (f.xcb."0.8.2".debug_all or false) ||
        (xcb."0.8.2"."debug_all" or false) ||
        (f.xcb."0.8.2".present or false) ||
        (xcb."0.8.2"."present" or false) ||
        (f.xcb."0.8.2".randr or false) ||
        (xcb."0.8.2"."randr" or false) ||
        (f.xcb."0.8.2".xfixes or false) ||
        (xcb."0.8.2"."xfixes" or false); }
      { "0.8.2"."res" =
        (f.xcb."0.8.2"."res" or false) ||
        (f.xcb."0.8.2".debug_all or false) ||
        (xcb."0.8.2"."debug_all" or false); }
      { "0.8.2"."screensaver" =
        (f.xcb."0.8.2"."screensaver" or false) ||
        (f.xcb."0.8.2".debug_all or false) ||
        (xcb."0.8.2"."debug_all" or false); }
      { "0.8.2"."shape" =
        (f.xcb."0.8.2"."shape" or false) ||
        (f.xcb."0.8.2".debug_all or false) ||
        (xcb."0.8.2"."debug_all" or false) ||
        (f.xcb."0.8.2".xfixes or false) ||
        (xcb."0.8.2"."xfixes" or false); }
      { "0.8.2"."shm" =
        (f.xcb."0.8.2"."shm" or false) ||
        (f.xcb."0.8.2".debug_all or false) ||
        (xcb."0.8.2"."debug_all" or false) ||
        (f.xcb."0.8.2".xv or false) ||
        (xcb."0.8.2"."xv" or false); }
      { "0.8.2"."sync" =
        (f.xcb."0.8.2"."sync" or false) ||
        (f.xcb."0.8.2".present or false) ||
        (xcb."0.8.2"."present" or false); }
      { "0.8.2"."thread" =
        (f.xcb."0.8.2"."thread" or false) ||
        (f.xcb."0.8.2".debug_all or false) ||
        (xcb."0.8.2"."debug_all" or false); }
      { "0.8.2"."xevie" =
        (f.xcb."0.8.2"."xevie" or false) ||
        (f.xcb."0.8.2".debug_all or false) ||
        (xcb."0.8.2"."debug_all" or false); }
      { "0.8.2"."xf86dri" =
        (f.xcb."0.8.2"."xf86dri" or false) ||
        (f.xcb."0.8.2".debug_all or false) ||
        (xcb."0.8.2"."debug_all" or false); }
      { "0.8.2"."xfixes" =
        (f.xcb."0.8.2"."xfixes" or false) ||
        (f.xcb."0.8.2".composite or false) ||
        (xcb."0.8.2"."composite" or false) ||
        (f.xcb."0.8.2".damage or false) ||
        (xcb."0.8.2"."damage" or false) ||
        (f.xcb."0.8.2".debug_all or false) ||
        (xcb."0.8.2"."debug_all" or false) ||
        (f.xcb."0.8.2".present or false) ||
        (xcb."0.8.2"."present" or false) ||
        (f.xcb."0.8.2".xinput or false) ||
        (xcb."0.8.2"."xinput" or false); }
      { "0.8.2"."xinerama" =
        (f.xcb."0.8.2"."xinerama" or false) ||
        (f.xcb."0.8.2".debug_all or false) ||
        (xcb."0.8.2"."debug_all" or false); }
      { "0.8.2"."xkb" =
        (f.xcb."0.8.2"."xkb" or false) ||
        (f.xcb."0.8.2".debug_all or false) ||
        (xcb."0.8.2"."debug_all" or false); }
      { "0.8.2"."xlib_xcb" =
        (f.xcb."0.8.2"."xlib_xcb" or false) ||
        (f.xcb."0.8.2".debug_all or false) ||
        (xcb."0.8.2"."debug_all" or false); }
      { "0.8.2"."xprint" =
        (f.xcb."0.8.2"."xprint" or false) ||
        (f.xcb."0.8.2".debug_all or false) ||
        (xcb."0.8.2"."debug_all" or false); }
      { "0.8.2"."xselinux" =
        (f.xcb."0.8.2"."xselinux" or false) ||
        (f.xcb."0.8.2".debug_all or false) ||
        (xcb."0.8.2"."debug_all" or false); }
      { "0.8.2"."xtest" =
        (f.xcb."0.8.2"."xtest" or false) ||
        (f.xcb."0.8.2".debug_all or false) ||
        (xcb."0.8.2"."debug_all" or false); }
      { "0.8.2"."xv" =
        (f.xcb."0.8.2"."xv" or false) ||
        (f.xcb."0.8.2".debug_all or false) ||
        (xcb."0.8.2"."debug_all" or false) ||
        (f.xcb."0.8.2".xvmc or false) ||
        (xcb."0.8.2"."xvmc" or false); }
      { "0.8.2"."xvmc" =
        (f.xcb."0.8.2"."xvmc" or false) ||
        (f.xcb."0.8.2".debug_all or false) ||
        (xcb."0.8.2"."debug_all" or false); }
      { "0.8.2".default = (f.xcb."0.8.2".default or true); }
    ];
  }) [
    (features_.libc."${deps."xcb"."0.8.2"."libc"}" deps)
    (features_.log."${deps."xcb"."0.8.2"."log"}" deps)
    (features_.libc."${deps."xcb"."0.8.2"."libc"}" deps)
  ];


# end
# zxcvbn-1.0.1

  crates.zxcvbn."1.0.1" = deps: { features?(features_.zxcvbn."1.0.1" deps {}) }: buildRustCrate {
    crateName = "zxcvbn";
    version = "1.0.1";
    description = "An entropy-based password strength estimator, originally for Javascript by Dropbox.";
    authors = [ "Josh Holmer <jholmer.in@gmail.com>" ];
    sha256 = "1pwvqiplzg0g9mi12s2pgil72kfh0c23an34kpczx5ac5cm9ahwi";
    dependencies = mapFeatures features ([
      (crates."derive_builder"."${deps."zxcvbn"."1.0.1"."derive_builder"}" deps)
      (crates."fancy_regex"."${deps."zxcvbn"."1.0.1"."fancy_regex"}" deps)
      (crates."itertools"."${deps."zxcvbn"."1.0.1"."itertools"}" deps)
      (crates."lazy_static"."${deps."zxcvbn"."1.0.1"."lazy_static"}" deps)
      (crates."quick_error"."${deps."zxcvbn"."1.0.1"."quick_error"}" deps)
      (crates."regex"."${deps."zxcvbn"."1.0.1"."regex"}" deps)
      (crates."time"."${deps."zxcvbn"."1.0.1"."time"}" deps)
    ]);
    features = mkFeatures (features."zxcvbn"."1.0.1" or {});
  };
  features_.zxcvbn."1.0.1" = deps: f: updateFeatures f (rec {
    derive_builder."${deps.zxcvbn."1.0.1".derive_builder}".default = true;
    fancy_regex."${deps.zxcvbn."1.0.1".fancy_regex}".default = true;
    itertools."${deps.zxcvbn."1.0.1".itertools}".default = true;
    lazy_static = fold recursiveUpdate {} [
      { "${deps.zxcvbn."1.0.1".lazy_static}"."nightly" =
        (f.lazy_static."${deps.zxcvbn."1.0.1".lazy_static}"."nightly" or false) ||
        (zxcvbn."1.0.1"."unstable" or false) ||
        (f."zxcvbn"."1.0.1"."unstable" or false); }
      { "${deps.zxcvbn."1.0.1".lazy_static}".default = true; }
    ];
    quick_error."${deps.zxcvbn."1.0.1".quick_error}".default = true;
    regex."${deps.zxcvbn."1.0.1".regex}".default = true;
    time."${deps.zxcvbn."1.0.1".time}".default = true;
    zxcvbn = fold recursiveUpdate {} [
      { "1.0.1"."clippy" =
        (f.zxcvbn."1.0.1"."clippy" or false) ||
        (f.zxcvbn."1.0.1".dev or false) ||
        (zxcvbn."1.0.1"."dev" or false); }
      { "1.0.1"."serde" =
        (f.zxcvbn."1.0.1"."serde" or false) ||
        (f.zxcvbn."1.0.1".ser or false) ||
        (zxcvbn."1.0.1"."ser" or false); }
      { "1.0.1"."serde_derive" =
        (f.zxcvbn."1.0.1"."serde_derive" or false) ||
        (f.zxcvbn."1.0.1".ser or false) ||
        (zxcvbn."1.0.1"."ser" or false); }
      { "1.0.1"."unstable" =
        (f.zxcvbn."1.0.1"."unstable" or false) ||
        (f.zxcvbn."1.0.1".dev or false) ||
        (zxcvbn."1.0.1"."dev" or false); }
      { "1.0.1".default = (f.zxcvbn."1.0.1".default or true); }
    ];
  }) [
    (features_.derive_builder."${deps."zxcvbn"."1.0.1"."derive_builder"}" deps)
    (features_.fancy_regex."${deps."zxcvbn"."1.0.1"."fancy_regex"}" deps)
    (features_.itertools."${deps."zxcvbn"."1.0.1"."itertools"}" deps)
    (features_.lazy_static."${deps."zxcvbn"."1.0.1"."lazy_static"}" deps)
    (features_.quick_error."${deps."zxcvbn"."1.0.1"."quick_error"}" deps)
    (features_.regex."${deps."zxcvbn"."1.0.1"."regex"}" deps)
    (features_.time."${deps."zxcvbn"."1.0.1"."time"}" deps)
  ];


# end
}
