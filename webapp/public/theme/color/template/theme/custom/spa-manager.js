/**
 * SINGLE PAGE APPLICATION
 * See template /public/themes/color/assets/js/apps.js
 * Search from line: 1302
 * Or search by text: 28. Handle Ajax Mode - added in V4.0
 */

const spaClassForContent   = 'spalink' // SPA page class indentifier
const spaClassForComponent = 'spacomp' // SPA component class indentifier
const defaultElement   = `#content` // SPA
const defaultScripts   = `#scripts`
const jsPathResource   = ``
const jsAsyncIndentity = `async-script`
// -------------
/*
    HTML
*/
async function componentHTML(location = '', data = '') {

    if (location == '') return null

    let request = await fetch(location, {
        method  : 'POST',
        body    : JSON.stringify(data),
        headers : {
            //'X-CSRF-TOKEN' : CSRF_TOKEN,
            'Accept': 'application/json',
            'Content-Type': 'application/json'
        }
    })

    if (request.status == 200) return await request.text()

    return request.status;
}

// -------------
/*
    HTML Component
*/
function spaComponent(elem) {
    let uri = elem.href.split(BOARD)[1]
    let target = elem.dataset.target
    let path = uri.split('/'); path = path.splice(1)

    document.querySelector(target).innerHTML = uri

}

// -------------
/**
 * SPA loader
 */
function urlParams(path = '') {
    let data, query;

    if (path == '') {
        query = window.location.search.split('?')
    } else {
        query = path.at(-1).split('?')
    }

    if (query[1] != undefined) {
        let search = query[1]
        data = JSON.parse('{"' + decodeURI(search).replace(/"/g, '\\"').replace(/&/g, '","').replace(/=/g,'":"') + '"}')
    }

    return data
}

async function insertContent(target, content = '') {
    document.querySelector(target).innerHTML = content
}

function removeScripts() {
    const elements = document.getElementsByClassName('async-script');
    while (elements.length > 0) elements[0].parentNode.removeChild(elements[0]);
}

function isJsonString(content) {
    try { return JSON.parse(content); } catch (e) { return false; };
}

async function setContent(params = null) {
    let element, data, location, content, PrefixBoard;

    console.log(params)
    return
    data = params.hasOwnProperty('data') ? params.data : null;
    element = params.hasOwnProperty('element') ? params.element : null;

    PrefixBoard = BOARD; if (PrefixBoard != '') PrefixBoard = `${BOARD}`;

    location = ``
    if (params.hasOwnProperty('location')) {
        location = `${PrefixBoard}/content/${params.location}`
    } else {
        location = `${PrefixBoard}/content/${PATH_A}`
        if (PATH_B != '') location = `${PrefixBoard}/content/${PATH_A}/${PATH_B}`;
        if (PATH_C != '') location = `${PrefixBoard}/content/${PATH_A}/${PATH_B}/${PATH_C}`;
        if (PATH_D != '') location = `${PrefixBoard}/content/${PATH_A}/${PATH_B}/${PATH_C}/${PATH_D}`;
        if (PATH_E != '') location = `${PrefixBoard}/content/${PATH_A}/${PATH_B}/${PATH_C}/${PATH_D}/${PATH_E}`;
    }

    content = await componentHTML(location, data)

    if (content === null) return;

    // CSRF or session is not valid
    /* let json = isJsonString(content)
    if (json) { // content == 'nosession' || content == 419
        // if (content == 419 || (json.error && json.error == 'session expired')) {
        //     window.location.href = `/logout`; return
        // }

        content; return
    } */

    /* if (content == 500) {
        content = `
            <h1 class="page-header">Error 500<small> something went wrong.</small></h1>
            <p>Checkout window terminal network response or put in contact with webmaster.</p>
        `;
    } */

    /* if (content == 'nosession' || content == 419) {
        window.location.href = `/`; return
    } */

    removeScripts()

    element = element == null ? defaultElement : element;
    insertContent(element, content).then(function() {
        let contentScripts = document.querySelector(defaultElementJsScripts)
        if (contentScripts != null) {
            contentScripts = contentScripts.value
            scripts = JSON.parse(contentScripts)
            scripts.forEach(script => {
                if (script != '') {
                    let scriptName, functionName;
                    if (typeof script === 'string' || ! script instanceof String) {
                        scriptName = script
                    } else {
                        scriptName = script[0]
                        functionName = `${script[1]}`
                    }
                    let elem    = document.createElement('script')
                    let elemId  = hashMix(7)
                    //elem.id         = `${jsAsyncIndentity}-${elemId}`
                    elem.async      = true
                    elem.className  = jsAsyncIndentity
                    elem.type       = 'text/javascript'

                    let isExternal  = scriptName.split('http')
                    elem.src        = isExternal.length == 1 ? `${jsPathResource}${scriptName}?${elemId}` : `${scriptName}`
                    document.body.appendChild(elem)
                    elem.onload = () => {
                        // do stuff with the script switching scriptID cases
                        if (functionName) {
                            var scriptActionOnLoad = new Function(functionName);
                            scriptActionOnLoad()
                        }
                    }
                }
            })
        }
    })

    // clear accumulated console logs
    //console.clear()
}

/**
 * Custom default settings
 */

//setContent({'data':urlParams()})

//
function beforeMiddleWareFunctions() {
    //resetNavigationMenu()
}

function afterMiddleWareFunctions() {
    //setNavigationMenu()
}

/**
 * SPA engine
 */

// Set browser history URL referer for feedback on window.pushState
const pushCurrentUriVisited = (uri) => {
    let historyBack = `${PCI}//${HOST}`

    if (BOARD != '') {
        historyBack += `/${BOARD}${uri}`
    } else {
        historyBack += `${uri}`
    }

    history.pushState({}, null, historyBack)
}

// SPA trigger
function triggerSpaContent(params = null) {
    params = {
        'location' : `${params.location}`
    }

    setContent(params)

    pushCurrentUriVisited(`/${params.location}`)
}

// Get url query params and return as object


function currentLocation(path = '') {
    let location, i;

    i = 0
    if (BOARD != '') i++;
    PATH_A = ''; if (path.length > i) { PATH_A = path[i]; location += `/${PATH_A}`; i++ }
    PATH_B = ''; if (path.length > i) { PATH_B = path[i]; location += `/${PATH_B}`; i++ }
    PATH_C = ''; if (path.length > i) { PATH_C = path[i]; location += `/${PATH_C}`; i++ }
    PATH_D = ''; if (path.length > i) { PATH_D = path[i]; location += `/${PATH_D}`; i++ }
    PATH_E = ''; if (path.length > i) { PATH_E = path[i]; location += `/${PATH_E}`; i++ }

    return location
}

function spaContent(elem, action = 'content') {
    let uri, path, i, target;

    i = 0
    uri  = elem.href
    path = uri.split(`${PCI}//${HOST}/`)[1]
    path = path.split('/')

    if (elem.dataset.element) target = elem.dataset.element

    if (action != 'content') {
        // feature development
    } else {
        beforeMiddleWareFunctions()
        setContent({'data':urlParams(path)})
        pushCurrentUriVisited(currentLocation(path))
        afterMiddleWareFunctions()
    }
}

window.onpopstate = (e) => {
    let url  = location.href;
    let uri  = url.split(BOARD)[1];
    let path = uri.split('/');

    PATH_A = path[1];
    PATH_B = ''; if (path.length >= 3) PATH_B = path[2];
    PATH_C = ''; if (path.length >= 4) PATH_C = path[3];
    PATH_D = ''; if (path.length >= 5) PATH_D = path[4];
    PATH_E = ''; if (path.length >= 6) PATH_E = path[5];

    setContent({'data':urlParams(path)})

    // load animation...

    e.preventDefault(e)

    return
}

// SPA HTML listener
document.body.addEventListener('click', (event) => {
	let elem = event.target.closest('a')
    if (elem) {

        if (elem.href.substr(elem.href.length - 1) == "#") {
            event.preventDefault()
        }

        let array = elem.className.split(' ')

        if (array.indexOf(spaClassForContent) !== -1) {
            spaContent(elem)
            event.preventDefault()
        }

        if (array.indexOf(spaClassForComponent) !== -1) {
            //spaContent(elem, 'component')
            event.preventDefault()
        }
    }
})
