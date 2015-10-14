<<<<<<< HEAD
(function($){
	$.ui.dialog.prototype.options.closeOnEscape = false;
	$.widget("wp.wpdialog", $.ui.dialog, {
		options: {
			closeOnEscape: false
		},

		open: function() {
			var ed;

			// Initialize tinyMCEPopup if it exists and is the editor is active.
			if ( tinyMCEPopup && typeof tinyMCE != 'undefined' && ( ed = tinyMCE.activeEditor ) && !ed.isHidden() ) {
				tinyMCEPopup.init();
			}

			// Add beforeOpen event.
			if ( this._isOpen || false === this._trigger('beforeOpen') ) {
				return;
			}

			// Open the dialog.
			$.ui.dialog.prototype.open.apply( this, arguments );
			// WebKit leaves focus in the TinyMCE editor unless we shift focus.
			this.element.focus();
			this._trigger('refresh');
		}
	});
})(jQuery);
=======
(function($){
	$.ui.dialog.prototype.options.closeOnEscape = false;
	$.widget("wp.wpdialog", $.ui.dialog, {
		options: {
			closeOnEscape: false
		},

		open: function() {
			var ed;

			// Initialize tinyMCEPopup if it exists and is the editor is active.
			if ( tinyMCEPopup && typeof tinyMCE != 'undefined' && ( ed = tinyMCE.activeEditor ) && !ed.isHidden() ) {
				tinyMCEPopup.init();
			}

			// Add beforeOpen event.
			if ( this._isOpen || false === this._trigger('beforeOpen') ) {
				return;
			}

			// Open the dialog.
			$.ui.dialog.prototype.open.apply( this, arguments );
			// WebKit leaves focus in the TinyMCE editor unless we shift focus.
			this.element.focus();
			this._trigger('refresh');
		}
	});
})(jQuery);
>>>>>>> 814faae5d63c225913c29c7f628440a425af8b16
