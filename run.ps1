if (${env:GITHUB_WORKSPACE} -eq ${null}) {
  ${env:GITHUB_WORKSPACE}=${pwd}
}

pushd ${env:GITHUB_WORKSPACE}/build
	ctest --build-config Release
popd
