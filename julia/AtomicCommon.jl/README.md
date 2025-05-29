# Changing the shared data definitions

While developing, any time you make changes to `/definitions`, you need to run `update_artifacts.jl` for the package to "see" the changes.

This will copy the artifacts to the global Julia artifacts directory (usually `~/.julia/artifacts`) and update the `Artifacts.toml` file to point to there (as well as pointing to the Github URL where these artifacts will be uploaded, should this exact version be released in the future).

# Making a release

To make a release, you need to (in this order):

1. Set the version number in `Project.toml`
2. Run `update_artifacts.jl` *(could be a Git hook to make sure you don't forget, although you'll always need it to locally test changes)*
3. Commit the changes
4. Tag the commit with the same version number as in `Project.toml`
5. Push the commit and tag
6. Create a release on GitHub for the tag
7. Upload the `/definitions.tgz` file created in (2) to the release *(CI could do this)*

You can now install the package with:
```
pkg> add https://github.com/marius311/atomic_common@1.0.0:julia/AtomicCommon.jl
```

Note, only "released" versions can be installed in this way, not any arbitrary commit. 