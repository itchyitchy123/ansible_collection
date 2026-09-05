# Contributing

1. Make each behavior change in a focused commit with a clear imperative
   message.
2. Update the relevant role README, argument specification, compatibility
   matrix, and changelog entry.
3. Run `make yaml-lint lint syntax molecule` before opening a pull request.
4. Add or extend Molecule coverage for behavior changes, including the default
   values and at least one supported platform where practical.
5. Do not introduce unpinned downloads, plaintext secrets, or destructive
   default behavior without an explicit acknowledgement variable.

Pull requests should state the tested operating systems, risk to existing
hosts, and rollback procedure.
