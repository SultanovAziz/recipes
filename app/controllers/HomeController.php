<?phpnamespace app\controllers;class HomeController extends AppController{    public function __construct($route)    {        parent::__construct($route);    }    public function indexAction()    {        $this->setMeta('Главная страница','Описание','Ключевики');    }}