<?php

if ( ! defined('BASEPATH') )
    exit( 'No direct script access allowed' );

require_once( 'application/third_party/smarty-3.1.29/libs/Smarty.class.php' );

class Smartyci extends Smarty
{
    public function __construct()
    {
        parent::__construct();

        $config =& get_config();

        $this->caching = 0;
        $this->setTemplateDir( APPPATH . 'views' );
        $this->setCompileDir( APPPATH . 'third_party/smarty-3.1.29/templates_c' );
        $this->setConfigDir( APPPATH . 'third_party/smarty-3.1.29/configs' );
        $this->setCacheDir( APPPATH . 'cache' );
    }

    //if specified template is cached then display template and exit, otherwise, do nothing.
    public function useCached( $tpl, $cacheId = null )
    {
        if ( $this->isCached( $tpl, $cacheId ) )
        {
            $this->display( $tpl, $cacheId );
            exit();
        }
    }
}
?>
