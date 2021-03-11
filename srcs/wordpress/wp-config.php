<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the
 * installation. You don't have to use the web site, you can
 * copy this file to "wp-config.php" and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * MySQL settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://codex.wordpress.org/Editing_wp-config.php
 *
 * @package WordPress
 */

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'wordpress' );

/** MySQL database username */
define( 'DB_USER', 'wordpress' );

/** MySQL database password */
define( 'DB_PASSWORD', 'wppass' );

/** MySQL hostname */
define( 'DB_HOST', 'mysql-service' );

/** Database Charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8mb4' );

/** The Database Collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

define( 'CONCATENATE_SCRIPTS', false );

define( 'SCRIPT_DEBUG', true );

/**#@+
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
 define('AUTH_KEY',         'jIKOz@j{dy~YnkwpmLMj_|7h3V:5&A>OO-iF:5}p0k)c}0!@LmHT-wr^A+?-(Mhk');
 define('SECURE_AUTH_KEY',  '?y8#,,Vp; 8Jptwix3yNte4z?1&l+[ vpa_!$RhU!iw@Bk~d{)a{/nq:gOcO;!A$');
 define('LOGGED_IN_KEY',    'G&aw0PR0Iw>o*A+{lAGO 4e{2cj1U.5UUfPJH^u`Qe-H3A,wBka8^/h [Z#5|n5l');
 define('NONCE_KEY',        'Z@Z4=L_t+z|ltHV9GX^k]ASGlBy-d8z/.Y{N;6.}vRi:43l%#q-%Lq:- vgY3|E8');
 define('AUTH_SALT',        '#6`LwI9,lZK&~Zf}rkVN$+<jvk><^?|9 PGaTU+.3D>32zPoqKErDz Gl@u;{pp-');
 define('SECURE_AUTH_SALT', ' t8=7<jMTag:%8_F~XJ?7ITOaQD&0FJGdY?GFwHNCn r#np=$>D+HAobLV5Vslm6');
 define('LOGGED_IN_SALT',   ' :&JMq?olihp[5bLn2:lpq!@+mGTOFI%wir}7JvV|:0l@gSaIq?zD TFxik.P}Qi');
 define('NONCE_SALT',       'a-.lE-&Mymjf.C])I%N.WMEw@Db%M{^)E@[Z!E^FM20{o)bai,EcI4G_K~@>+3`v');

/**#@-*/

/**
 * WordPress Database Table prefix.
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
 * visit the Codex.
 *
 * @link https://codex.wordpress.org/Debugging_in_WordPress
 */
define( 'WP_DEBUG', false );

/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', dirname( __FILE__ ) . '/' );
}

/** Sets up WordPress vars and included files. */
require_once( ABSPATH . 'wp-settings.php' );