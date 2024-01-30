/**
 * Parent link class as Vue doesn't change parent class of <route-link>
 */

function handleHeaderNavMutation(element) {
    let obsElement = new MutationObserver(function (mutations) {
        mutations.forEach(function (mutation) {
            if (mutation.target.classList.contains('router-link-active')) element.parentElement.classList.add('active');
            else element.parentElement.classList.remove('active');
        })
    })
    obsElement.observe(element, { attributes: true, attributeFilter: ['class'] })
}
let obsHeaderNavHome = handleHeaderNavMutation(document.querySelector(`[href="/home.html"]`))
let obsHeaderNavContact = handleHeaderNavMutation(document.querySelector(`[href="/contact.html"]`))
let obsHeaderNavProducts = handleHeaderNavMutation(document.querySelector(`[href="/products.html"]`))

