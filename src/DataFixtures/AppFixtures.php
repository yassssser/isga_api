<?php

namespace App\DataFixtures;

use App\Entity\Absence;
use App\Entity\Administrateur;
use App\Entity\Classe;
use App\Entity\Etudiant;
use App\Entity\Exam;
use App\Entity\Matiere;
use Doctrine\Bundle\FixturesBundle\Fixture;
use Doctrine\Common\Persistence\ObjectManager;
use Faker\Factory;
use Symfony\Component\Security\Core\Encoder\UserPasswordEncoderInterface;

class AppFixtures extends Fixture
{
    private $passwordEncoder;
    private $faker;

    public function __construct(UserPasswordEncoderInterface $passwordEncoder)
    {
        $this->passwordEncoder = $passwordEncoder;
        $this->faker = Factory::create();
    }

    public function load(ObjectManager $manager)
    {
        // $product = new Product();
        // $manager->persist($product);

        $this->loadAdministrateur($manager);
        $this->loadClasse($manager);
        $this->loadMatiere($manager);
        $this->loadEtudiant($manager);
        $this->loadExam($manager);
        $this->loadAbsence($manager);

        $manager->flush();
    }

    public function loadAdministrateur(ObjectManager $manager){
        for($i=0 ; $i<10 ; $i++){
            $admin = new Administrateur();
            $admin->setNom("nom_admin_$i");
            $admin->setPrenom("prenom_admin_$i");
            $admin->setPassword($this->passwordEncoder->encodePassword($admin , 'sercet123'));
            $admin->setEmail("admin$i@isga.ma");
            $admin->setTel("0666666666");
            $admin->setRole("Admin");

            $this->addReference("admin_$i", $admin);
            
            $manager->persist($admin);
        }
            $manager->flush();
    }

    public function loadClasse(ObjectManager $manager){
        for($i=0 ; $i<10 ; $i++){
            $classe = new Classe();
            $classe->setNom("5ILDW");
            $classe->setPromotion("2019-2020");
            $classe->setFiliere("EI");
            $classe->setEmploi("emploi_$i");

            $admin = $this->getReference("admin_".rand(0,9));
            $classe->setAdministrateur($admin);

            $this->addReference("classe_$i", $classe);
            $manager->persist($classe);
        }
        $manager->flush();
    }

    public function loadMatiere(ObjectManager $manager){
        for($i=0 ; $i<10 ; $i++){
            $matiere = new Matiere();
            $matiere->setNom("Matiere_$i");
            $matiere->setNbrHeure(28);
            $matiere->setSalle("1A");
            $matiere->setDate(new \DateTime());

            $admin = $this->getReference("admin_".rand(0,9));
            $classe = $this->getReference("classe_".rand(0,9));
            $this->addReference("matiere_$i", $matiere);

            $matiere->setAdministrateur($admin);
            $matiere->setClasse($classe);

            $manager->persist($matiere);
        }
        $manager->flush();
    }

    public function loadEtudiant(ObjectManager $manager){
        for($i=0 ; $i<10 ; $i++){
            $etd = new Etudiant();
            $etd->setNom("nom_etudiant_$i");
            $etd->setPrenom("prenom_etudiant_$i");
            $etd->setTel("0666666666");
            $etd->setEmail("etudiant$i@isga.ma");
            $etd->setCodeEtd("E111$i");
            $etd->setPassword($this->passwordEncoder->encodePassword($etd , 'sercet123'));
            $etd->setRole("Etudiant");

            $admin = $this->getReference("admin_".rand(0,9));
            $classe = $this->getReference("classe_".rand(0,9));
            $this->addReference("etd_$i", $etd);

            $etd->setAdministrateur($admin);
            $etd->setClasse($classe);

            $manager->persist($etd);
        }
        $manager->flush();
    }

    public function loadExam(ObjectManager $manager){
        for($i=0 ; $i<10 ; $i++){
            $exam = new Exam();

            $exam->setNom("DM$i");
            $exam->setDate(new \DateTime());
            $exam->setNote(rand(5,20));
            $exam->setValidation(true);
            
            $admin = $this->getReference("admin_".rand(0,9));
            $matiere = $this->getReference("matiere_".rand(0,9));
            $etd = $this->getReference("etd_".rand(0,9));

            $exam->setAdministrateur($admin);
            $exam->setMatiere($matiere);
            $exam->setEtudiant($etd);

            $manager->persist($exam);
        }
        $manager->flush();
    }

    public function loadAbsence(ObjectManager $manager){
        for($i=0 ; $i<10 ; $i++){
            $abs = new Absence();

            $abs->setDate(new \DateTime());
            $abs->setJustification(false);
            $abs->setNbrHeure(9);

            $admin = $this->getReference("admin_".rand(0,9));
            $matiere = $this->getReference("matiere_".rand(0,9));
            $etd = $this->getReference("etd_".rand(0,9));

            $abs->setAdministrateur($admin);
            $abs->setMatiere($matiere);
            $abs->setEtudiant($etd);

            $manager->persist($abs);
        }
        $manager->flush();
    }

}
