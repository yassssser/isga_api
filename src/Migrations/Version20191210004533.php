<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20191210004533 extends AbstractMigration
{
    public function getDescription() : string
    {
        return '';
    }

    public function up(Schema $schema) : void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->abortIf($this->connection->getDatabasePlatform()->getName() !== 'mysql', 'Migration can only be executed safely on \'mysql\'.');

        $this->addSql('ALTER TABLE absence ADD etudiant_id INT DEFAULT NULL, ADD matiere_id INT DEFAULT NULL, ADD administrateur_id INT DEFAULT NULL');
        $this->addSql('ALTER TABLE absence ADD CONSTRAINT FK_765AE0C9DDEAB1A3 FOREIGN KEY (etudiant_id) REFERENCES etudiant (id)');
        $this->addSql('ALTER TABLE absence ADD CONSTRAINT FK_765AE0C9F46CD258 FOREIGN KEY (matiere_id) REFERENCES matiere (id)');
        $this->addSql('ALTER TABLE absence ADD CONSTRAINT FK_765AE0C97EE5403C FOREIGN KEY (administrateur_id) REFERENCES administrateur (id)');
        $this->addSql('CREATE INDEX IDX_765AE0C9DDEAB1A3 ON absence (etudiant_id)');
        $this->addSql('CREATE INDEX IDX_765AE0C9F46CD258 ON absence (matiere_id)');
        $this->addSql('CREATE INDEX IDX_765AE0C97EE5403C ON absence (administrateur_id)');
        $this->addSql('ALTER TABLE classe ADD administrateur_id INT DEFAULT NULL');
        $this->addSql('ALTER TABLE classe ADD CONSTRAINT FK_8F87BF967EE5403C FOREIGN KEY (administrateur_id) REFERENCES administrateur (id)');
        $this->addSql('CREATE INDEX IDX_8F87BF967EE5403C ON classe (administrateur_id)');
        $this->addSql('ALTER TABLE etudiant ADD classe_id INT DEFAULT NULL');
        $this->addSql('ALTER TABLE etudiant ADD CONSTRAINT FK_717E22E38F5EA509 FOREIGN KEY (classe_id) REFERENCES classe (id)');
        $this->addSql('CREATE INDEX IDX_717E22E38F5EA509 ON etudiant (classe_id)');
        $this->addSql('ALTER TABLE exam ADD matiere_id INT DEFAULT NULL, ADD administrateur_id INT DEFAULT NULL, ADD etudiant_id INT DEFAULT NULL, ADD nom VARCHAR(255) NOT NULL');
        $this->addSql('ALTER TABLE exam ADD CONSTRAINT FK_38BBA6C6F46CD258 FOREIGN KEY (matiere_id) REFERENCES matiere (id)');
        $this->addSql('ALTER TABLE exam ADD CONSTRAINT FK_38BBA6C67EE5403C FOREIGN KEY (administrateur_id) REFERENCES administrateur (id)');
        $this->addSql('ALTER TABLE exam ADD CONSTRAINT FK_38BBA6C6DDEAB1A3 FOREIGN KEY (etudiant_id) REFERENCES etudiant (id)');
        $this->addSql('CREATE INDEX IDX_38BBA6C6F46CD258 ON exam (matiere_id)');
        $this->addSql('CREATE INDEX IDX_38BBA6C67EE5403C ON exam (administrateur_id)');
        $this->addSql('CREATE INDEX IDX_38BBA6C6DDEAB1A3 ON exam (etudiant_id)');
        $this->addSql('ALTER TABLE matiere ADD classe_id INT DEFAULT NULL, ADD administrateur_id INT DEFAULT NULL');
        $this->addSql('ALTER TABLE matiere ADD CONSTRAINT FK_9014574A8F5EA509 FOREIGN KEY (classe_id) REFERENCES matiere (id)');
        $this->addSql('ALTER TABLE matiere ADD CONSTRAINT FK_9014574A7EE5403C FOREIGN KEY (administrateur_id) REFERENCES administrateur (id)');
        $this->addSql('CREATE INDEX IDX_9014574A8F5EA509 ON matiere (classe_id)');
        $this->addSql('CREATE INDEX IDX_9014574A7EE5403C ON matiere (administrateur_id)');
    }

    public function down(Schema $schema) : void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->abortIf($this->connection->getDatabasePlatform()->getName() !== 'mysql', 'Migration can only be executed safely on \'mysql\'.');

        $this->addSql('ALTER TABLE absence DROP FOREIGN KEY FK_765AE0C9DDEAB1A3');
        $this->addSql('ALTER TABLE absence DROP FOREIGN KEY FK_765AE0C9F46CD258');
        $this->addSql('ALTER TABLE absence DROP FOREIGN KEY FK_765AE0C97EE5403C');
        $this->addSql('DROP INDEX IDX_765AE0C9DDEAB1A3 ON absence');
        $this->addSql('DROP INDEX IDX_765AE0C9F46CD258 ON absence');
        $this->addSql('DROP INDEX IDX_765AE0C97EE5403C ON absence');
        $this->addSql('ALTER TABLE absence DROP etudiant_id, DROP matiere_id, DROP administrateur_id');
        $this->addSql('ALTER TABLE classe DROP FOREIGN KEY FK_8F87BF967EE5403C');
        $this->addSql('DROP INDEX IDX_8F87BF967EE5403C ON classe');
        $this->addSql('ALTER TABLE classe DROP administrateur_id');
        $this->addSql('ALTER TABLE etudiant DROP FOREIGN KEY FK_717E22E38F5EA509');
        $this->addSql('DROP INDEX IDX_717E22E38F5EA509 ON etudiant');
        $this->addSql('ALTER TABLE etudiant DROP classe_id');
        $this->addSql('ALTER TABLE exam DROP FOREIGN KEY FK_38BBA6C6F46CD258');
        $this->addSql('ALTER TABLE exam DROP FOREIGN KEY FK_38BBA6C67EE5403C');
        $this->addSql('ALTER TABLE exam DROP FOREIGN KEY FK_38BBA6C6DDEAB1A3');
        $this->addSql('DROP INDEX IDX_38BBA6C6F46CD258 ON exam');
        $this->addSql('DROP INDEX IDX_38BBA6C67EE5403C ON exam');
        $this->addSql('DROP INDEX IDX_38BBA6C6DDEAB1A3 ON exam');
        $this->addSql('ALTER TABLE exam DROP matiere_id, DROP administrateur_id, DROP etudiant_id, DROP nom');
        $this->addSql('ALTER TABLE matiere DROP FOREIGN KEY FK_9014574A8F5EA509');
        $this->addSql('ALTER TABLE matiere DROP FOREIGN KEY FK_9014574A7EE5403C');
        $this->addSql('DROP INDEX IDX_9014574A8F5EA509 ON matiere');
        $this->addSql('DROP INDEX IDX_9014574A7EE5403C ON matiere');
        $this->addSql('ALTER TABLE matiere DROP classe_id, DROP administrateur_id');
    }
}
