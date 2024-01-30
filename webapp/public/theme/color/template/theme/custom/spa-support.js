/**
 * SPA Support
**/

async function awaitForPropertyToBeDefined(propertyName) {
    while (! window.hasOwnProperty(propertyName)) {
        await new Promise(resolve => setTimeout(resolve, 50))
    }

    return true
}

/**
 * Backend
**/

async function apiCoupling(bundle) {
    const postRequest = await fetch(bundle.url, {
        method : 'POST',
        headers : {
            Accept : "application/json",
            dataType : "json",
            contentType : 'application/json',
        },
        body : JSON.stringify(bundle.data)
    })
    const postRespond = await postRequest.json()

    return postRespond
}

/**
 * Backend
**/
function backend() {
    let PrefixBoard = BOARD
    if (PrefixBoard != '') PrefixBoard = `/${BOARD}`

    return `${PrefixBoard}/backend`
}

async function jsonGet(bundle) {
    const getRequest = await fetch(bundle.url, {
        method  : 'GET',
        headers : {
            'X-CSRF-TOKEN' : bundle.auth,
            Accept : "application/json",
            dataType : "json",
            contentType : 'application/json',
        }
    })
    const getRespond = await getRequest.json()

    return getRespond
}

async function jsonPost(bundle) {
    const postRequest = await fetch(bundle.url, {
        method : 'POST',
        headers : {
            'X-CSRF-TOKEN' : CSRF_TOKEN,
            Accept : "application/json",
            //dataType : "json",
            //contentType : 'application/json',
        },
        body : JSON.stringify(bundle.data)
    })
    const postRespond = await postRequest.json()

    return postRespond
}

async function formPost(data) {
    formData = new FormData()
    formData.append('_token', bundle.auth)
    if (data.function) formData.append('function', data.function)
    if (data.action) formData.append('action', data.action)
    if (data.json) formData.append('json', JSON.stringify(data.json))
    formData.append('enctype', 'multipart/form-data')
    if (data.files) {
        files = data.files
        for (let i = 0; i < files.length; i++) {
            formData.append([i], files[i])
        }
    }
    const postRequest = await fetch(data.url, {
        method: 'POST',
        body: formData,
        headers: {
            "Access-Control-Allow-Origin": "*",
            "Content-type": "application/x-www-form-urlencoded; charset=UTF-8"
        },
    })
    const postRespond = await postRequest.json()

    return postRespond
}

/**
 * Helpers
 * (async() => {})()
 */

const hashMix = (length, type = 'mix') => {
    let characters = '', charactersLength = 0, hash = '';

    if (type == 'integer') {
        characters = '0123456789'
    }
    if (type == 'mix') {
        characters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789'
    }
    if (type == 'password') {
        characters = '·~¡!#$%&=¿?@ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789'
    }

    charactersLength = characters.length;
    for (let i = 0; i < length; i++) hash += characters.charAt(Math.floor(Math.random() * charactersLength));

    return hash
}

// Modal - JQuery
const modal = {}
function modalDialogue(config) {

    let settings;
    if (config.static && config.static == true) {
        settings = {backdrop: 'static', keyboard: false}
    }

    let size = 'modal-dialog'
    if (config.size && config.size == 'large') size = size + ` modal-lg`

    let title = config.title ?? 'Dialog'

    let header = `<h4 class="modal-title">${title}</h4><button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>`
    if (config.static && config.static == true) {
        header = `<h4 class="modal-title">${title}</h4>`
    }

    let body = config.body ?? `<p>No content</p>`

    let footer = config.footer ?? `<button class="btn btn-white" class="close" data-dismiss="modal">Close</button>`

    $('#modal-dialog').html(
        `<div class="${size}">
            <div id="modal-content" class="modal-content">
                <div id="modal-header" class="modal-header">${header}</div>
                <div id="modal-body" class="modal-body">${body}</div>
                <div id="modal-footer" class="modal-footer">${footer}</div>
            </div>
        </div>`
    )

    $('#modal-dialog').modal(settings)
}
function modalDialogueClose() {
    $('#modal-dialog').modal('hide')
}

/**
 * Global Functions
 *
 */

/*
    Session
    Develop: this should ask to renew CSRF_TOKEN and then request the session update
*/
function updateSessionButtons() {
    return `
        <a href="/" class="btn btn-white pull-left">Cancel</a>
        <button class="btn btn-success pull-right" onclick="updateSession()">Update</button>
    `
}

function updateSessionForm() {
    modal.static = true
    modal.title = `Update session`
    modal.footer = updateSessionButtons()
    modal.body = `
        <form>
            <div class="form-group">
                <label for="access_user" class="col-form-label">Access User:</label>
                <input type="text" class="form-control" id="access_user" value="">
            </div>
            <div class="form-group">
                <label for="access_password" class="col-form-label">Password:</label>
                <input type="password" class="form-control" id="access_password" value="">
            </div>
        </form>
        <div id="modal-update-session-status" class="alert fade show">&nbsp;</div>
    `
    modalDialogue(modal)
    $('#modal-dialog').on('shown.bs.modal', function () {
        document.querySelector(`#access_user`).focus()
    })
}

function updateSession() {
    let user = document.querySelector(`#access_user`)
    let pass = document.querySelector(`#access_password`)

    bundle.url  = `/${BOARD}/login`
    bundle.data = {
        'email'     : user.value,
        'password'  : pass.value
    }

    let status = $(`#modal-update-session-status`)
    status.removeClass(`alert-danger`)
    status.addClass(`alert-light`)
    status.html(`&nbsp;`)

    $(`#modal-dialog .modal-footer`).html(`<button class="btn btn-yellow pull-right"><i class="fa fa-spin fa-spinner"></i> wait...</button>`)

    jsonPost(bundle).then((response) => {
        if (response.error) {
            status.removeClass(`alert-light`)
            status.addClass(`alert-danger`)
            status.html(response.error)

            $(`#modal-dialog .modal-footer`).html(updateSessionButtons())
        }
        if (response.status == true) {
            user.disabled = true
            pass.disabled = true
            status.removeClass(`alert-light`)
            status.removeClass(`alert-danger`)
            status.addClass(`alert-success`)
            status.html(`Login succeded`)

            $(`#modal-dialog .modal-footer`).html(`
                <button class="btn btn-success pull-right" class="close" data-dismiss="modal">Continue</button>
            `)
        }
    }).catch(function() {
        $(`#modal-dialog .modal-footer`).html(updateSessionButtons())
    })
}