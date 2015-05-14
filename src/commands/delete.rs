// Copyright 2014 The Peevee Developers
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

use std::fs::File;
use std::env;
use super::super::color::Color;
use super::super::password;
use super::super::password::ScrubMemory;
use super::super::rpassword::read_password;
use std::io::Write;

pub fn callback(args: &[String], file: &mut File) {
    let ref app_name = args[2];

    print_now!("Type your master password: ");
    match read_password() {
        Ok(ref mut master_password) => {
            match password::delete_password(master_password, app_name, file) {
                Ok(_) => {
                    okln!("Done! I've deleted the password for {}.", app_name);
                },
                Err(err) => {
                    errln!("I couldn't find a password for this app ({:?}).", err);
                    env::set_exit_status(1);
                }
            }
            master_password.scrub_memory();
        },
        Err(err) => {
            errln!("\nI couldn't read the master password ({:?}).", err);
            env::set_exit_status(1);
        }
    }
}
