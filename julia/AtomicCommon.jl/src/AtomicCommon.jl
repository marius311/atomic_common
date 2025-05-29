module AtomicCommon

using Pkg.Artifacts

greet() = open(joinpath(artifact"definitions", "shared_data.yaml")) do file
    println(read(file, String))
end

end # module AtomicCommon
