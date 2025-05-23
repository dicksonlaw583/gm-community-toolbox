function ArrayInsertExtTests(_run, _method) : VerrificMethodTest(_run, _method) constructor {
    static test_subject = "array_insert_ext";
    
    static should_insert_empty_array_into_empty_array = function() {
        given_destination([]);
        given_destination_index(0);
        given_source([]);
        when_source_inserted();
        then_destination_should_be_empty();
    }
    
    static should_insert_empty_array_into_items_array = function() {
        given_destination([1, 2, 3, 4, 5]);
        given_destination_index(3);
        given_source([]);
        when_source_inserted();
        then_destination_should_have_items(1, 2, 3, 4, 5);
    }
    
    static should_insert_items_array_into_empty_array = function() {
        given_destination([]);
        given_destination_index(0);
        given_source([6, 7, 8, 9, 0]);
        when_source_inserted();
        then_destination_should_have_items(6, 7, 8, 9, 0);
    }
    
    static should_insert_items_array_into_items_array = function() {
        given_destination([1, 2, 3, 4, 5]);
        given_destination_index(3);
        given_source([6, 7, 8, 9, 0]);
        when_source_inserted();
        then_destination_should_have_items(1, 2, 3, 6, 7, 8, 9, 0, 4, 5);
    }
    
    static should_insert_items_at_the_first_index = function() {
        given_destination([1, 2, 3, 4, 5]);
        given_destination_index(0);
        given_source([6, 7, 8, 9, 0]);
        when_source_inserted();
        then_destination_should_have_items(6, 7, 8, 9, 0, 1, 2, 3, 4, 5);
    }
    
    static should_insert_items_at_the_last_index = function() {
        given_destination([1, 2, 3, 4, 5]);
        given_destination_index(5);
        given_source([6, 7, 8, 9, 0]);
        when_source_inserted();
        then_destination_should_have_items(1, 2, 3, 4, 5, 6, 7, 8, 9, 0);
    }
    
    static should_insert_items_from_third_forward = function() {
        given_destination([1, 2, 3, 4, 5]);
        given_destination_index(0);
        given_source([6, 7, 8, 9, 0]);
        given_offset(2);
        when_source_inserted();
        then_destination_should_have_items(8, 9, 0, 1, 2, 3, 4, 5);
    }
    
    static should_insert_items_from_second_last_forward = function() {
        given_destination([1, 2, 3, 4, 5]);
        given_destination_index(0);
        given_source([6, 7, 8, 9, 0]);
        given_offset(-2);
        when_source_inserted();
        then_destination_should_have_items(9, 0, 1, 2, 3, 4, 5);
    }
    
    static should_insert_items_up_to_third = function() {
        given_destination([1, 2, 3, 4, 5]);
        given_destination_index(0);
        given_source([6, 7, 8, 9, 0]);
        given_offset(0);
        given_length(3);
        when_source_inserted();
        then_destination_should_have_items(6, 7, 8, 1, 2, 3, 4, 5);
    }
    
    static should_insert_items_from_second_to_fourth = function() {
        given_destination([1, 2, 3, 4, 5]);
        given_destination_index(0);
        given_source([6, 7, 8, 9, 0]);
        given_offset(1);
        given_length(3);
        when_source_inserted();
        then_destination_should_have_items(7, 8, 9, 1, 2, 3, 4, 5);
    }
    
    static should_insert_items_in_reverse = function() {
        given_destination([1, 2, 3, 4, 5]);
        given_destination_index(0);
        given_source([6, 7, 8, 9, 0]);
        given_offset(-1);
        given_length(-5);
        when_source_inserted();
        then_destination_should_have_items(0, 9, 8, 7, 6, 1, 2, 3, 4, 5);
    }
    
    static should_insert_items_from_fourth_to_second = function() {
        given_destination([1, 2, 3, 4, 5]);
        given_destination_index(0);
        given_source([6, 7, 8, 9, 0]);
        given_offset(3);
        given_length(-3);
        when_source_inserted();
        then_destination_should_have_items(9, 8, 7, 1, 2, 3, 4, 5);
    }
    
    static should_insert_items_from_lower_overlapping_range = function() {
        given_destination([1, 2, 3, 4, 5]);
        given_destination_index(0);
        given_source([6, 7, 8, 9, 0]);
        given_offset(-7);
        given_length(4);
        when_source_inserted();
        then_destination_should_have_items(6, 7, 1, 2, 3, 4, 5);
    }
    
    static should_insert_items_from_lower_overlapping_range_in_reverse = function() {
        given_destination([1, 2, 3, 4, 5]);
        given_destination_index(0);
        given_source([6, 7, 8, 9, 0]);
        given_offset(1);
        given_length(-4);
        when_source_inserted();
        then_destination_should_have_items(7, 6, 1, 2, 3, 4, 5);
    }
    
    static should_insert_items_from_upper_overlapping_range = function() {
        given_destination([1, 2, 3, 4, 5]);
        given_destination_index(0);
        given_source([6, 7, 8, 9, 0]);
        given_offset(3);
        given_length(4);
        when_source_inserted();
        then_destination_should_have_items(9, 0, 1, 2, 3, 4, 5);
    }
    
    static should_insert_items_from_upper_overlapping_range_in_reverse = function() {
        given_destination([1, 2, 3, 4, 5]);
        given_destination_index(0);
        given_source([6, 7, 8, 9, 0]);
        given_offset(6);
        given_length(-4);
        when_source_inserted();
        then_destination_should_have_items(0, 9, 1, 2, 3, 4, 5);
    }
    
    static should_not_insert_items_below_range = function() {
        given_destination([1, 2, 3, 4, 5]);
        given_destination_index(0);
        given_source([6, 7, 8, 9, 0]);
        given_offset(-10);
        given_length(3);
        when_source_inserted();
        then_destination_should_have_items(1, 2, 3, 4, 5);
    }
    
    static should_not_insert_items_above_range = function() {
        given_destination([1, 2, 3, 4, 5]);
        given_destination_index(0);
        given_source([6, 7, 8, 9, 0]);
        given_offset(10);
        given_length(-3);
        when_source_inserted();
        then_destination_should_have_items(1, 2, 3, 4, 5);
    }
    
    static should_insert_array_into_itself = function() {
        given_destination([1, 2, 3, 4, 5]);
        given_destination_index(2);
        given_source(destination);
        when_source_inserted();
        then_destination_should_have_items(1, 2, 1, 2, 3, 4, 5, 3, 4, 5);
    }
    
    static should_insert_array_section_into_itself = function() {
        given_destination([1, 2, 3, 4, 5]);
        given_destination_index(2);
        given_source(destination);
        given_offset(1);
        given_length(3);
        when_source_inserted();
        then_destination_should_have_items(1, 2, 2, 3, 4, 3, 4, 5);
    }
    
    static should_insert_array_reverse_section_into_itself = function() {
        given_destination([1, 2, 3, 4, 5]);
        given_destination_index(2);
        given_source(destination);
        given_offset(3);
        given_length(-3);
        when_source_inserted();
        then_destination_should_have_items(1, 2, 4, 3, 2, 3, 4, 5);
    }
    
    // -----
    // Setup
    // -----
    
    destination = undefined;
    destination_index = undefined;
    source = undefined;
    offset = undefined;
    length = undefined;
    
    static given_destination = function(_value) {
        destination = _value;
    }
    
    static given_destination_index = function(_value) {
        destination_index = _value;
    }
    
    static given_source = function(_value) {
        source = _value;
    }
    
    static given_offset = function(_value) {
        offset = _value;
    }
    
    static given_length = function(_value) {
        length = _value;
    }
    
    static when_source_inserted = function() {
        if (is_undefined(offset))
            array_insert_ext(destination, destination_index, source);
        else if (is_undefined(length))
            array_insert_ext(destination, destination_index, source, offset);
        else
            array_insert_ext(destination, destination_index, source, offset, length);
    }
    
    static then_destination_should_be_empty = function() {
        assert_equal(0, array_length(destination), $"The destination should be empty but isn't.");
    }
    
    static then_destination_should_have_items = function() {
        if (!assert_equal(argument_count, array_length(destination), $"The new number of destination items should be {argument_count} but is {array_length(destination)} instead."))
            return;
        
        for (var i = 0; i < argument_count; i++) {
            assert_equal(argument[i], destination[i], $"The destination item #{i} should be '{argument[i]}' but is '{destination[i]}' instead.");
        }
    }
}
