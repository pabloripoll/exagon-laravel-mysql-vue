/**
 *
 *
 */

function navigationMenu() {
    let html = ''//`<li class="nav-header"><i class="fa fa-sitemap"></i> MENU</li>`
    Object.keys(MENU).forEach(menuPanel => {
        var panel = MENU[menuPanel]

        html += `<div class="menu-header">${panel.html.title.eng}</div>`

        /* if (Object.keys(panel.menu).length == 0) {
            html += `
            <li data-target="/${panel.html.url}">
                <a class="spapage" href="/${BOARD}/${panel.html.url}">
                    <i class="${panel.html.icon}"></i>
                    <span>${panel.html.title.eng}</span>
                </a>
            </li>`
        } else { */
        if (Object.keys(panel.menu).length != 0) {
            html += `
            <div class="menu-item">
                <a href="/" class="menu-link">
                    <span class="menu-icon"><i class="fa fa-qrcode"></i></span>
                    <span class="menu-text">Welcome</span>
                </a>
            </div>
            `
            /* html += `
            <li class="has-sub closed" data-target="/${panel.html.url}">
                <a href="javascript:;">
                    <b class="caret"></b>
                    <i class="${panel.html.icon}"></i>
                    <span>${panel.html.title.eng}</span>
                </a>
                <ul class="sub-menu">`
                Object.keys(panel.menu).forEach(panelModule => {
                    var module = panel.menu[panelModule]
                    if (module.menu === undefined) {
                        html += `
                        <li data-target="/${panel.html.url}/${module.html.url}">
                            <a class="spapage" href="/${BOARD}/${panel.html.url}/${module.html.url}">
                                ${module.html.title.eng}
                            </a>
                        </li>`
                    } else {
                        html += `
                        <li class="has-sub" data-target="/${panel.html.url}/${module.html.url}">
                            <a href="javascript:;">
                                <b class="caret"></b>
                                ${module.html.title.eng}
                            </a>
                            <ul class="sub-menu">`
                            Object.keys(module.menu).forEach(moduleSection => {
                                var section = module.menu[moduleSection]
                                var url = `/${BOARD}/${panel.html.url}/${module.html.url}/${section.html.url}`
                                var target = `class="spapage"`
                                if (section.html.ref == '_blank') {
                                    url = section.html.url
                                    target = `target="_blank"`
                                }

                                html += `
                                <li data-target="/${panel.html.url}/${module.html.url}/${section.html.url}">
                                    <a ${target} href="${url}">${section.html.title.eng}</a>
                                </li>`
                            })
                        html += `
                            </ul>
                        </li>`
                    }
                })
            html += `
                </ul>
            </li>` */
        }
    })

   /*  html += `
    <li>
        <a href="javascript:;" class="sidebar-minify-btn" data-click="sidebar-minify">
            <i class="fa fa-angle-double-left"></i>
        </a>
    </li>
    ` */

    return html
}

document.querySelector('#navmenu').innerHTML = navigationMenu() // for first load

function resetNavigationMenu() {
    var elems = document.querySelectorAll('li.has-sub')
    elems.forEach(function(e){
        e.classList.remove('expand')
        e.classList.remove('active')
        e.classList.add('closed')
    })

    var elems = document.querySelectorAll('.sub-menu')
    elems.forEach(function(e){
        e.style.display = 'none'
    })

    var elems = document.querySelectorAll('.sub-menu li')
    elems.forEach(function(e){
        e.classList.remove('active')
    })
}

function setNavigationMenu() {

    if (document.querySelector(`[data-target="/${PANEL}"]`) === null) return;

    var ePanel = document.querySelector(`[data-target="/${PANEL}"]`)

    if (ePanel) {
        ePanel.classList.add('active')
        ePanel.classList.remove('closed')
        ePanel.classList.add('expand')
        ePanel.querySelector('.sub-menu').style.display = 'block'
    }

    if (MODULE != '') {
        var eModule = ePanel.querySelector(`[data-target="/${PANEL}/${MODULE}"]`)
        if (eModule) {
            eModule.classList.add('active')
            if (eModule.classList.contains('has-sub')) {
                eModule.classList.remove('closed')
                eModule.classList.add('expand')
                eModule.querySelector('.sub-menu').style.display = 'block'
            }
        }
    }

    /* if (SECTION != '') {
        if (eModule.querySelector(`[data-target="/${PANEL}/${MODULE}/${SECTION}"]`).length > 0) {
            var eSection = eModule.querySelector(`[data-target="/${PANEL}/${MODULE}/${SECTION}"]`)
            if (eSection) {
                eSection.classList.add('active')
            }
        }
    } */

}

//setNavigationMenu() // for first load
