    <div class="row">        <?php foreach ($recipe as $dish): ?>            <div class="col-md-3">                <div class="card box-shadow">                    <a href="recipe/show?id=<?= $dish->id; ?>"><img class="card-img-top"  src="img/recipe/<?= $dish->img; ?>" alt="Dish image"></a>                    <div class="card-body">                        <h3 id="title" class="card-title"><a href="recipe/show?id=<?= $dish->id; ?>"><?= $dish->name; ?></a></h3>                        <p class="card-text"><?= $dish->description; ?></p>                        <div class="d-flex justify-content-between align-items-center">                            <div class="btn-group">                                <button type="button" class="btn btn-sm btn-outline-secondary delete-recipe" data-id="<?= $dish->id;?>">Удалить</button>                                <button type="button" class="btn btn-sm btn-outline-secondary edit-recipe" data-id="<?= $dish->id;?>">Редактировать</button>                            </div>                        </div>                    </div>                </div>            </div>        <?php endforeach;?>    </div>