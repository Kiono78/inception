<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the installation.
 * You don't have to use the web site, you can copy this file to "wp-config.php"
 * and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * Database settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://wordpress.org/support/article/editing-wp-config-php/
 *
 * @package WordPress
 */

// ** Database settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'wordpress' );

/** Database username */
define( 'DB_USER', 'bterral' );

/** Database password */
define( 'DB_PASSWORD', 'my_secret' );

/** Database hostname */
define( 'DB_HOST', 'localhost' );

/** Database charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8' );

/** The database collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**#@+
 * Authentication unique keys and salts.
 *
 * Change these to different unique phrases! You can generate these using
 * the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}.
 *
 * You can change these at any point in time to invalidate all existing cookies.
 * This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define('AUTH_KEY',         'wZ;hXXbz-CE}$ @m|[6-?tgu/SXH!:u$&I3LZCWo>/PrVs`p{cGoL$0VF6HSEg`+');
define('SECURE_AUTH_KEY',  'aeo|7CSq< A,dFt|k`IB>/!2My#|5b#jNhQMgpc@H-k -YFW_3FM*8k93nk+TQhJ');
define('LOGGED_IN_KEY',    '$wWz3ff83<`SNVaU|tw%uz4)@FO%{Z]sBfV_wXmmx8qRrL-oB@--a.B{7.};0L;-');
define('NONCE_KEY',        'q;IbKxZV}Yjx`sJW3;q|%5&<1l}$[7(+Z^M9XBDIU+HE3h3}3h.uXI+|*S-{YM@,');
define('AUTH_SALT',        '0YndkJ{!-$^H#./+A;xVsfhpLWnFu0o]zGHAGa-;!WaCqTr8+:XQo8x{g4-1aY.b');
define('SECURE_AUTH_SALT', '&tEDQmezSjU{##@_``3l-P +6$YYOA4wYB-nWd!SI~)![.4zfG1.CILG)Cdw d?V');
define('LOGGED_IN_SALT',   '{-&ef;6#`:z+|l}/jlYoHE|&-PvNR?R6kM+fxk.y;MgvGyED AwVzpt-WZ~}M-iU');
define('NONCE_SALT',       'QSSYwsV&5?Zt#0IvRaM*4:x1Aikm#Q-,(1l2JSq%%vrhx^!)8Z&74l%R-W+`wWig');
/**#@-*/

/**
 * WordPress database table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the documentation.
 *
 * @link https://wordpress.org/support/article/debugging-in-wordpress/
 */
define( 'WP_DEBUG', false );

/* Add any custom values between this line and the "stop editing" line. */



/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';
