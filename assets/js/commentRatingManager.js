document.addEventListener('DOMContentLoaded', function() {
    const stars = document.querySelectorAll('.star-rating i');
    const ratingInput = document.getElementById('rating');
    let rating = 0;

    stars.forEach(star => {
        star.addEventListener('click', function() {
            rating = this.dataset.value;
            ratingInput.value = rating;
            highlightStars(rating);
        });

        star.addEventListener('mouseover', function() {
            colorStars(this.dataset.value);
        });

        star.addEventListener('mouseout', function() {
            colorStars(rating);
        });
    });

    function highlightStars(value) {
        stars.forEach((star, index) => {
            star.classList.toggle('fa-solid', index < value);
            star.classList.toggle('fa-regular', index >= value);
        });
    }

    function colorStars(value) {
        stars.forEach((star, index) => {
            star.style.color = index < value ? 'var(--gold)' : 'white';
        });
    }

    document.querySelector('.add-comment button').addEventListener('click', function(event) {
        const commentText = document.querySelector('.add-comment textarea').value;
        if (!commentText || !rating) {
            event.preventDefault();
        }
    });

    const textarea = document.getElementById('comment-textarea');
    
    textarea.addEventListener('input', function() {
        this.style.height = 'auto';
        this.style.height = (this.scrollHeight + 5) + 'px';
    });

    textarea.style.height = (textarea.scrollHeight + 5) + 'px';
});
