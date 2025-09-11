<?php if ( ! defined ( 'BASEPATH')) exit('No direct script access allowed');

class Main extends CSP_Controller
{
    protected $permission;

    public function __construct()
    {
        parent::__construct();

        $this->permission = $this->permission_model->get_permissions( $this->get_login_id() );
    }


    // ----------------------------------------------------- DASHBOARD //
    public function index()
    {
        $permissions    = $this->permission;
        $targets        = array(
            $this->config->item( 'permission_dashboard' ),
            $this->config->item( 'permission_analytics' ),
        );

        if ( count( array_intersect( (array) $permissions->read, $targets ) ) < 3 )
        {
            redirect( '/reporting/advertisers' );
        }

        $data = array(
            'role_id' => $this->config->config['role_id'],
        );

        $this->sections = array(
            'title'     => "Home | Dashboard",
            'pid'       => "dashboard",
            'content'   => $this->load->view( 'dashboard/default', $data, true ),
            'scripts'   => $this->load->view( 'dashboard/scripts/default', $data, true ),
        );
    }
}
