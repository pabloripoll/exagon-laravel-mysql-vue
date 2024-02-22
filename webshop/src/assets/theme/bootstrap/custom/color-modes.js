/*!
 * Color mode toggler for Bootstrap's docs (https://getbootstrap.com/)
 * Copyright 2011-2023 The Bootstrap Authors
 * Licensed under the Creative Commons Attribution 3.0 Unported License.
 */

(() => {
    'use strict'

    const getStoredTheme = () => localStorage.getItem('theme')
    const setStoredTheme = theme => localStorage.setItem('theme', theme)
    const switcherThemeBtn = document.querySelector('#switch-theme-btn')

    const getPreferredTheme = () => {
        const storedTheme = getStoredTheme()
        if (storedTheme) {
            return storedTheme
        }

        return window.matchMedia('(prefers-color-scheme: dark)').matches ? 'dark' : 'light'
    }

    const setTheme = theme => {
        if (theme === 'auto' && window.matchMedia('(prefers-color-scheme: dark)').matches) {
            document.documentElement.setAttribute('data-bs-theme', 'dark')
        } else {
            document.documentElement.setAttribute('data-bs-theme', theme)
        }
    }

    setTheme(getPreferredTheme())

    switcherThemeBtn.addEventListener('click', (event) => {
        let switcherIconSet = event.target.classList[1]
        let switcherIconUpdate = 'fa-toggle-off'
        let switcherThemeReset = 'light'

        if (switcherIconSet == 'fa-toggle-off') {
            switcherIconUpdate = 'fa-toggle-on'
            switcherThemeReset = 'dark'
        }

        event.target.classList.remove(switcherIconSet)
        event.target.classList.add(switcherIconUpdate)
        setTheme(switcherThemeReset)
        setStoredTheme(switcherThemeReset)
    })

    if (getPreferredTheme() == 'dark') {
        switcherThemeBtn.children[0].classList.remove('fa-toggle-off')
        switcherThemeBtn.children[0].classList.add('fa-toggle-on')
    }

})()