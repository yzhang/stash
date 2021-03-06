const { resolve } = require('path')
const { promises: fsAsync } = require('fs')

// to prevent alias overwrite

const main = async () => {
  const bashScriptNameList = await loadBashScriptNameList()
  console.log(`found ${bashScriptNameList.length} bash script`)

  const aliasMap = new Map()
  for (const bashScriptName of bashScriptNameList) {
    console.log('[bashScriptName]', bashScriptName) // console.log(bashScript, '==', content.substr(0, 1024))
    const content = String(await fsAsync.readFile(resolve(__dirname, bashScriptName)))

    let result
    while (result = REGEXP_ALIAS.exec(content)) {
      const [ , aliasName ] = result
      console.log('  [aliasName]', aliasName)
      if (aliasMap.has(aliasName)) throw new Error(`duplicate aliasName "${aliasName}" from: "${aliasMap.get(aliasName)}" and "${bashScriptName}"`)
      aliasMap.set(aliasName, bashScriptName)
    }
  }
  console.log(`verified ${aliasMap.size} alias`)
}

const loadBashScriptNameList = async () => (await fsAsync.readdir(__dirname))
  .filter((name) => name.endsWith('.sh'))

const REGEXP_ALIAS = /alias ([\w]+)=/g

main().then(
  () => console.log('done'),
  (error) => {
    console.error(error)
    process.exitCode = 1
  }
)
