Describe 'General' {
    BeforeEach {
        rm -Recurse TestDrive:\test_package -ea ignore
        cp -Recurse -Force $PSScriptRoot\test_package TestDrive:\test_package
        pushd TestDrive:\test_package
    }

    It 'considers au_root global variable when looking for packages' {
        $path = 'TestDrive:\packages\test_package2'
        mkdir $path -Force
        cp -Recurse -Force $PSScriptRoot\test_package\* $path

        $global:au_root = Split-Path $path
        $res = lsau

        $res | Should Not BeNullOrEmpty
        $res[0].Name | Should Be 'test_package2'
    }
    popd
}
