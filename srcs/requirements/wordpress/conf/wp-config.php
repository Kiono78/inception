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
define( 'DB_HOST', 'mariadb' );

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
define('AUTH_KEY',         '+a$?vM72RYnQ+b`)}#Fs7Z.t;gc:H!-U|NRyJqtI$mEl(fjhblL9M)ny2VTU<gtp');
define('SECURE_AUTH_KEY',  'eSL41`,RrXOOE]O8Sa)Ap-+0Vp,vGAk$[1-TXd8I ^Dq|%iYcO.baG-t5_3-nOQi');
define('LOGGED_IN_KEY',    ']57194 P0y,9m--U8cm^A*]+cta^(`N>}yI/AR7{}BjnF<jCHUcPGm_Ah}RFa|*P');
define('NONCE_KEY',        'eTY`HIPU(#H+]F-3STA^V.kMNQ-:OM*y.9Od|Y.1XX=HkVp_Jf~uJ/L=672vE38]');
define('AUTH_SALT',        'CfkXe[M-Y;SKV|`U||a5t/?^rO1,HHmEZ`V8=Eb^@xScTB2HA+i?@cEv9$0%0[+O');
define('SECURE_AUTH_SALT', '_Oroe]u+IFNDb9>t`Q@b+Cfo6hD[uWXt8+o/ivr-cGuD/M6NU d(r9CvRo6KX{G@');
define('LOGGED_IN_SALT',   'zJOcoazjcVa$5NN6@-$[r-Bhmf49(f2Z{+l|md.sXyNWk`zwi,Ea=n&t|UC,>-BR');
define('NONCE_SALT',       'B<YBd}_Y0Vw49IuOH|AFQL]Zh}>}($ke!RKavPw(C2 #Q.V0-@Wn!d.k,W^4v)S+');
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
