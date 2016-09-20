class CreateRelationshipCommentUsers < ActiveRecord::Migration
  def change
    create_table :relationship_comment_users do |t|
      t.references :user, index: true, foreign_key: true
    end
  end
end
