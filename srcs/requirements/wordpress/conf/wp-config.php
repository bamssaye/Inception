<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the installation.
 * You don't have to use the website, you can copy this file to "wp-config.php"
 * and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * Database settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://developer.wordpress.org/advanced-administration/wordpress/wp-config/
 *
 * @package WordPress
 */

// ** Database settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'database_name_here' );

/** Database username */
define( 'DB_USER', 'username_here' );

/** Database password */
define( 'DB_PASSWORD', 'password_here' );

/** Database hostname */
define( 'DB_HOST', 'localhost' );

/** Database charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8mb4' );

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
define('AUTH_KEY',         'J{*(~kl@&C zyBzHDO3^ -2J;Q*P,zzz.$k|C6Dt|W>z#Sa(I+^HO6M)J(Qlvdn@');
define('SECURE_AUTH_KEY',  '2|EhWDb3~$Jpg*(A[.225bvQzlI#h;pCyv4AA>OwD%SIt>:7u ILPj|R?Q$Iwt`d');
define('LOGGED_IN_KEY',    '0V$$=ub!RHT`4+w<W7fJ91.xq4Xn{k|_L[Yk(b)|F$UN);Nc<Z9qK{M*B|g:Ue_}');
define('NONCE_KEY',        'h5EacsEQ x`w<%OUe4NDLCdUUg@0-)=O|+-@d_4qC[).GB>YZQoussh0~FP$Azmu');
define('AUTH_SALT',        '1?}>yf>K}vvx6TMi5){NSUk4n9Jx[.=d@-+v>xB7ohW?Z[7N?:%3uJOQu>,p=B36');
define('SECURE_AUTH_SALT', '`fiq|]]eJ)D;>S2K^y^pDt-an7oY(g4/ t:ZqZ}TzBC$I9Mvi<u+T~-z%7AlL/KC');
define('LOGGED_IN_SALT',   'q%HejMqGY+TP7}uO6oAo17+gL4uHwTJt~r>Wurr%8waX[m;M<ODs?;xOTW^4^A;!');
define('NONCE_SALT',       'Yi,V#?Ctd^8T)[6f(6647x:.B#=x#q=bQ/.srBx*#|+sN|3U)F-#(LLUbZasXzXz');

/**#@-*/

/**
 * WordPress database table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 *
 * At the installation time, database tables are created with the specified prefix.
 * Changing this value after WordPress is installed will make your site think
 * it has not been installed.
 *
 * @link https://developer.wordpress.org/advanced-administration/wordpress/wp-config/#table-prefix
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
 * @link https://developer.wordpress.org/advanced-administration/debug/debug-wordpress/
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