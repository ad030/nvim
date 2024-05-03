-- home directory
local home = os.getenv("HOME")

-- current project file
local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")

-- jdtls workspace directory
local workspace_path = vim.fn.stdpath("data") .. "/jdtls-workspace"
local workspace_dir = workspace_path .. "-" .. project_name

-- mason path
local mason_path = vim.fn.stdpath("data") .. "/mason"

-- language server location
local jdtls_path = require("mason-registry").get_package("jdtls"):get_install_path()

-- lombok location
local lombok_path = mason_path .. "/packages/lombok-nightly/lombok.jar"

-- necessary for debugging
local bundles = {
	vim.fn.glob(mason_path .. "/share/java-debug-adapter/com.microsoft.java.debug.plugin.jar"),
}

-- necessary for debugging unit tests
vim.list_extend(bundles, vim.split(vim.fn.glob(mason_path .. "/share/java-test/*.jar", 1), "\n"))

-- jdtls launcher jar
local launcher_jar = vim.fn.glob(jdtls_path .. "/plugins/org.eclipse.equinox.launcher_*.jar")

-- check if jdtls exists, else return
local status, jdtls = pcall(require, "jdtls")
if not status then
	return
end

-- jdtls extended client capabilities
local extendedClientCapabilities = jdtls.extendedClientCapabilities

-- get directory
local function get_config_dir()
	if vim.fn.has("win") == 1 then
		return "config_linux"
	elseif vim.fn.has("mac") == 1 then
		return "config_mac"
	else
		return "config_linux"
	end
end

-- config for jdtls
local config = {
	cmd = {
		"java",
		"-Declipse.application=org.eclipse.jdt.ls.core.id1",
		"-Dosgi.bundles.defaultStartLevel=4",
		"-Declipse.product=org.eclipse.jdt.ls.core.product",
		"-Dlog.protocol=true",
		"-Dlog.level=ALL",
		"-javaagent:" .. lombok_path,
		"-Xmx1g",
		"--add-modules=ALL-SYSTEM",
		"--add-opens",
		"java.base/java.util=ALL-UNNAMED",
		"--add-opens",
		"java.base/java.lang=ALL-UNNAMED",

		"-jar",
		launcher_jar,
		"-configuration",
		vim.fs.normalize(jdtls_path .. "/" .. get_config_dir()),
		"-data",
		workspace_dir,
	},
	root_dir = require("jdtls.setup").find_root({ ".git", "mvnw", "gradlew", "pom.xml", "build.gradle" }),

	settings = {
		java = {
			signatureHelp = { enabled = true },
			maven = {
				downloadSources = true,
			},
			eclipse = {
				downloadSources = true,
			},
			implementationsCodeLens = {
				enabled = true,
			},

			referencesCodeLens = {
				enabled = true,
			},
			references = {
				includeDecompiledSources = true,
			},
			inlayHints = {
				parameterNames = {
					enabled = "all",
				},
			},
			format = {
				enabled = true,
				settings = {
					url = "https://github.com/google/styleguide/blob/gh-pages/intellij-java-google-style.xml",
					profile = "GoogleStyle",
				},
			},
		},

		extendedClientCapabilities = extendedClientCapabilities,

		completion = {
			favoriteStaticMembers = {
				"org.hamcrest.MatcherAssert.assertThat",
				"org.hamcrest.Matchers.*",
				"org.hamcrest.CoreMatchers.*",
				"org.junit.jupiter.api.Assertions.*",
				"java.util.Objects.requireNonNull",
				"java.util.Objects.requireNonNullElse",
				"org.mockito.Mockito.*",
			},
			importOrder = {
				"java",
				"javax",
				"com",
				"org",
			},
		},

		sources = {
			organizeImports = {
				starThreshold = 9999,
				staticStarThreshold = 9999,
			},
		},

		codeGeneration = {
			toString = {
				template = "${object.className}{${member.name()}=${member.value}, ${otherMembers}}",
			},
			useBlocks = true,
		},
	},

	capabilities = require("cmp_nvim_lsp").default_capabilities(),

	flags = {
		allow_incremental_sync = true,
	},

	init_options = {
		bundles = bundles,
	},
}

-- attach the config to the language server
require("jdtls").start_or_attach(config)
