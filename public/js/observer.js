const ratio = .1
const options = {
	root: null,
	rootMargin: '0px',
	threshold: ratio
}

const handleIntersect = function(entries, observer) {
	entries.forEach(function(entry){
		if(entry.intersectionRatio>ratio) {
			entry.target.classList.add('reveal-visible')
		} else {
			entry.target.classList.remove('reveal-visible')
		}
	})
}

var observer = new IntersectionObserver(handleIntersect, options);
document.querySelectorAll('.reveal').forEach(function(r) {
	observer.observe(r)
})
