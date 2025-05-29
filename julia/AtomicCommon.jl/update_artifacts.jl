using Tar, Inflate, SHA, Pkg.Artifacts, TOML

topdir = abspath(joinpath(@__DIR__, "../.."))
tarball = joinpath(topdir, "definitions.tgz")
Tar.create(joinpath(topdir, "definitions"), tarball)

current_version = TOML.parsefile(joinpath(@__DIR__, "Project.toml"))["version"]

artifact_hash = Artifacts.create_artifact() do dir_name
    Tar.extract(tarball, dir_name)
end

Artifacts.bind_artifact!(
    joinpath(@__DIR__, "Artifacts.toml"),
    "definitions",
    artifact_hash,
    download_info = [
        (
            "https://github.com/marius311/atomic_common/releases/download/$(current_version)/definitions.tgz", 
            bytes2hex(open(sha256, tarball))
        )
    ],
    force = true
)

println("Created `$tarball` with artifact hash `$artifact_hash`.")