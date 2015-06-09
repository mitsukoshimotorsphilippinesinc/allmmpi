<?php defined('BASEPATH') or exit('No direct script access allowed');

/**
 * Settings Library
 */
class Settings {
	
	private static $cache = array();
	
	public function __construct()
	{
		// load the settings model
		ci()->load->model('settings_model');
	
		//$this->get_all();
	}
	
	
	/**
	 * Getter
	 * magic getter
	 */
	public function __get($name)
	{
		return self::get($name);
	}
	
	/**
	 * Setter
	 * magic setter
	 */
	public function __set($name, $value)
	{
		return self::set($name, $value);
	}
	
	/**
	 * Get
	 * get a setting
	 */
	public static function get($name)
	{
		if (isset(self::$cache[$name]))
		{
			return self::$cache[$name];
		}
		
		$setting = ci()->settings_model->get_setting_by_slug($name);
		
		// Setting doesn't exist, maybe it's a config option
		$value = $setting ? $setting->value : config_item($name);

		// Store it for later
		self::$cache[$name] = $value;

		return $value;
	}
	
	/**
	 * Set
	 * set a setting
	 */
	public static function set($name, $value)
	{
		if (is_string($name))
		{
			if (is_scalar($value))
			{
				$setting = ci()->settings_model->update_settings(array('value' => $value), array('slug' => $name));
			}

			self::$cache[$name] = $value;

			return TRUE;
		}

		return FALSE;
	}
	
	/**
	 * Get all settings
	 */
	/*public function get_all()
	{
		if (self::$cache)
		{
			return self::$cache;
		}
		
		$settings = ci()->settings_model->get_settings();
		
		foreach ($settings as $setting)
		{
			self::$cache[$setting->slug] = $setting->value;
		}

		return self::$cache;
	}*/
	
}

// end of php file