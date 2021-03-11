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
define('AUTH_KEY',         '/xNWQ&i:EoVJ}4=|boN-~F%tPN5z/([hp+GX(B{Cb;F78!:XbptI>&6dXjLHqd=m');
define('SECURE_AUTH_KEY',  'zI2fN7zATMzl4ggpLiLqvKy$+2+~K6c*OdY9Q9eDtCb O/ZfAqAtJ,{Ve.P%|zd;');
define('LOGGED_IN_KEY',    '+Z13yleRF`=wMbrGQE,DX#f6BCm+A+.HRR@ z?}|E#Q*hZR>-v[{J_R~(R9LRE|E');
define('NONCE_KEY',        'jt4`Yz7URl)FHg#$R!eMPH6Hux#3(}%FE;-<,cui*~1`lu{ak*q8_ThxneBHF4CZ');
define('AUTH_SALT',        'um@n+HR7mE$ ;e[wB95=hZ$8/oeYewIQJ&1;diQiA?$>FFuO_2:;Y|#7W.3]-:L4');
define('SECURE_AUTH_SALT', '`d9*Nf:W<AUL&M2V:uPKh6~cY7cQ]83-P_RCW6,if*$Y5x?!V~+s.bf=&H~fUK/Y');
define('LOGGED_IN_SALT',   'udZBG:+M>}cUJn6pF/iOA_~IH{W7TPRy%r3G<]TN+PnO-XuVD4A#|rt(Qy-3?WFs');
define('NONCE_SALT',       '@wbd/~3bV=A5`]q8+.[aayb/B)g`G3i>krD~/Ti~@abq?Q(Q-GAM`MAgLKwu<[XL');

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