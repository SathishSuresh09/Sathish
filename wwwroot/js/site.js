$(document).ready(function() {
    // Tab switching functionality
    $('.tab-btn').click(function() {
        const tabId = $(this).data('tab');
        
        // Update active tab button
        $('.tab-btn').removeClass('active');
        $(this).addClass('active');
        
        // Hide all tab content
        $('.tab-content').removeClass('active');
        
        // Show selected tab content
        $(`#${tabId}`).addClass('active');
        
        // Reset and trigger animations for icons
        $('.skill-icon').removeClass('animate');
        $(`#${tabId} .skill-icon`).each(function(index) {
            const icon = $(this);
            setTimeout(function() {
                icon.addClass('animate');
            }, index * 100); // Stagger the animation
        });
    });
    
    // Trigger animation for initial load
    $('#frontend .skill-icon').each(function(index) {
        const icon = $(this);
        setTimeout(function() {
            icon.addClass('animate');
        }, index * 100);
    });
});
