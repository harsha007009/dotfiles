return {
	cmd = { 
		"C:/mingw64/bin/clangd.exe",
		"--background-index",
		"--clang-tidy",
		"--header-insertion=iwyu",
		"--completion-style=detailed",
		"--function-arg-placeholders",
		"--fallback-style=llvm",
		"--query-driver=C:/mingw64/bin/gcc.exe,C:/mingw64/bin/g++.exe",
		"--cross-file-rename",
		"--suggest-missing-includes",
		"--all-scopes-completion",
		"--compile-commands-dir=",
		"--log=error"
	},
	filetypes = { "c", "cpp", "objc", "objcpp", "cuda", "proto" },
	root_markers = { 
		"Makefile",
		"configure.ac",
		"configure.in",
		"config.h.in",
		"meson.build",
		"meson_options.txt",
		"build.ninja",
		"CMakeLists.txt",
		"compile_commands.json",
		".clangd",
		"compile_flags.txt",
		".git"
	},
	init_options = {
		usePlaceholders = true,
		completeUnimported = true,
		clangdFileStatus = true,
	},
	settings = {
		clangd = {
			-- Enable inlay hints
			InlayHints = {
				Enabled = false,
				ParameterNames = false,
				DeducedTypes = false,
			},
			-- Better completion
			Completion = {
				AllScopes = true,
				ArgumentLists = "FullPlaceholders",
				HeaderInsertion = "IWYU",
			},
			-- Index configuration
			Index = {
				Background = "Build",
				StandardLibrary = true,
			},
		},
	},
}
