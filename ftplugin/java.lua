-- home directory
local home = os.getenv("HOME")

-- current project file
local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")

-- jdtls workspace directory
local workspace_path = home .. "/.local/share/nvim/jdtls-workspace"
local workspace_dir = workspace_path .. project_name

-- language server location
local jdtls_path = vim.fn.stdpath("data") .. "/mason/packages/jdtls"

-- jdtls launcher jar
local launcher_jar =
	vim.fn.glob(home .. "/.local/share/nvim/mason/packages/jdtls/plugins/org.eclipse.equinox.launcher_*.jar")

-- check if jdtls exists, else return
local status, jdtls = pcall(require, "jdtls")
if not status then
	return
end

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

-- jdtls extended client capabilities
local extendedClientCapabilities = jdtls.extendedClientCapabilities

-- config for jdtls
local config = {
	cmd = {
		"java",
		"-Declipse.application=org.eclipse.jdt.ls.core.id1",
		"-Dosgi.bundles.defaultStartLevel=4",
		"-Declipse.product=org.eclipse.jdt.ls.core.product",
		"-Dlog.protocol=true",
		"-Dlog.level=ALL",
		"-Xmx1g",
		"--add-modules=ALL-SYSTEM",
		"--add-opens",
		"java.base/java.util=ALL-UNNAMED",
		"--add-opens",
		"java.base/java.lang=ALL-UNNAMED",
		"-javaagent:" .. home .. "/.local/share/nvim/mason/packages/jdtls/lombok.jar",
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
			extendedClientCapabilities = extendedClientCapabilities,
			maven = {
				downloadSources = true,
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
				enabled = false,
			},
		},
	},

	init_options = {
		bundles = {},
	},
}

-- attach the config to the language server
require("jdtls").start_or_attach(config)
