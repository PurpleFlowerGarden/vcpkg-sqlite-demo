if (${env:GITHUB_WORKSPACE} -eq ${null}) {
  ${env:GITHUB_WORKSPACE}=${pwd}
}

cmake -E make_directory ${env:GITHUB_WORKSPACE}/build

pushd ${env:GITHUB_WORKSPACE}/build
	cmake -DCMAKE_TOOLCHAIN_FILE="${env:GITHUB_WORKSPACE}/vcpkg/scripts/buildsystems/vcpkg.cmake" ..
	cmake --build . --config Release -- "-v:n"
popd