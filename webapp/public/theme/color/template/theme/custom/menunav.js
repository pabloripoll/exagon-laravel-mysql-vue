/**
 *
 *
 */

function navigationMenu() {
    let html = ''
    Object.keys(MENU).forEach(menuPanel => {
        var panel = MENU[menuPanel]

        html += `<div class="menu-header"><i class="${panel.html.icon}"></i> ${panel.html.title.eng}</div>`

        if (Object.keys(panel.menu).length != 0) {
            Object.keys(panel.menu).forEach(panelModule => {
                var module = panel.menu[panelModule]
                if (module.menu === undefined) {
                    html += `
                    <div class="menu-item">
                        <a href="/${panel.html.url}/${module.html.url}" class="spapage menu-link">
                            <span class="menu-icon"><i class="${module.html.icon}"></i></span>
                            <span class="menu-text">${module.html.title.eng}</span>
                        </a>
                    </div>`
                } else {
                    html += `
                    <div class="menu-item has-sub">
                        <a href="javascript:;" class="menu-link">
                            <span class="menu-icon">
                                <i class="fa fa-envelope-open-text"></i>
                            </span>
                            <span class="menu-text">${module.html.title.eng}</span>
                            <span class="menu-caret"><b class="caret"></b></span>
                        </a>
                        <div class="menu-submenu">`
                        Object.keys(module.menu).forEach(moduleSection => {
                            var section = module.menu[moduleSection]
                            var url = `/${panel.html.url}/${module.html.url}/${section.html.url}`
                            var target = `class="spapage menu-link"`
                            if (section.html.ref == '_blank') {
                                url = section.html.url
                                target = `target="_blank" class="spapage menu-link"`
                            }
                            html += `
                                <div class="menu-item">
                                    <a href="${url}" ${target}>
                                        <span class="menu-text">${section.html.title.eng}</span>
                                    </a>
                                </div>`
                        })
                    html += `
                        </div>
                    </div>`
                }
            })
        }
    })

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
