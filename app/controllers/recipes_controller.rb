class RecipesController < ApplicationController

    def show
        @recipe = Recipe.find_by(id: params[:id])
    end

    def index
        @recipes = Recipe.all
    end

    def new
        @recipe = Recipe.new
        @ingredients = Ingredient.all
    end

    def create
        @recipe = Recipe.new(recipe_params)
        if @recipe.save
            redirect_to recipes_path
        else
            render :new
        end    
    end

    def edit
        @recipe = Recipe.find_by(id: params[:id])
        @ingredients = Ingredient.all
    end

    def update
        @recipe = Recipe.find_by(id: params[:id])
        @recipe.update(recipe_params)
        if @recipe.save
            redirect_to recipes_path
        else
            render :edit
        end
    end

    private

    def recipe_params
        params.require(:recipe).permit(:name, ingredient_ids:[], ingredients_attributes: [:name])
    end

end