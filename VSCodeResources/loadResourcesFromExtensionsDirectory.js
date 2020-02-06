/**
 * Files you want to inject in vscode
 *
 * {
 *  extensionUID: extension unique identifier (usually "publisher.extension-name", e.g: 'robbowen.synthwave-vscode'),
 *  filename: name of the file (or path to the file) in the extension directory (e.g: 'synthwave84-noglow.css')
 * }
 */
const resources = [
    {
        extensionUID: 'robbowen.synthwave-vscode',
        filename: 'synthwave84.css'
    }
];

/**
 * The path to your vscode extensions directory
 * e.g /User/username/.vscode/extensions
 */
const vscodeExtensionsPath = `${nodeRequire('os').homedir()}/.vscode/extensions`;



const fs = nodeRequire('fs');
const extensions = fs.readdirSync(vscodeExtensionsPath);

// Removes trailing slashs
const clean = path => path.replace(/^\/+|\/+$/g, '');

// Find and load all resources in vscode
resources.forEach(({ extensionUID, filename }) => {

    const extensionDirName = extensions.find(ext => ext.startsWith(`${extensionUID}-`));

    if (extensionDirName) {
        const filePath = `file:///${clean(vscodeExtensionsPath)}/${extensionDirName}/${clean(filename)}`;

        // Inject the resource in the DOM according to its type
        if (filename.endsWith('.css')) {

            const style = document.createElement('link');
            style.setAttribute('rel', 'stylesheet');
            style.setAttribute('href', filePath);
            document.head.appendChild(style);

        } else if (filename.endsWith('.js')) {

            const script = document.createElement('script');
            script.setAttribute('type', 'text/javascript');
            script.setAttribute('src', filePath);
            document.head.appendChild(script);

        }
    }
});