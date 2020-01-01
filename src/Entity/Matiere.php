<?php

namespace App\Entity;

use ApiPlatform\Core\Annotation\ApiResource;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;
use ApiPlatform\Core\Annotation\ApiSubresource;
use Symfony\Component\Serializer\Annotation\Groups;


/**
 * @ApiResource()
 * @ORM\Entity(repositoryClass="App\Repository\MatiereRepository")
 */
class Matiere
{
    /**
     * @ORM\Id()
     * @ORM\GeneratedValue()
     * @ORM\Column(type="integer")
     * @Groups({"get-classe-with-etd", "get-matiere-with-exam" , "get-etd-with-exam"})
     */
    private $id;

    /**
     * @ORM\Column(type="string", length=20)
     * @Groups({"get-classe-with-etd" ,"get-matiere-with-exam", "get-etd-with-exam" })
     */
    private $nom;

    /**
     * @ORM\Column(type="float")
     * @Groups({"get-classe-with-etd" ,"get-matiere-with-exam" , "get-etd-with-exam"})
     */
    private $nbr_heure;

    /**
     * @ORM\Column(type="string", length=10)
     * @Groups({"get-classe-with-etd" ,"get-matiere-with-exam" , "get-etd-with-exam"})
     */
    private $salle;

    /**
     * @ORM\Column(type="datetime")
     * @Groups({"get-classe-with-etd" ,"get-matiere-with-exam" , "get-etd-with-exam"})
     */
    private $date;

    /**
     * @ORM\ManyToOne(targetEntity="App\Entity\Classe", inversedBy="matieres")
     */
    private $classe;
 
    /**
     * @ORM\ManyToOne(targetEntity="App\Entity\Administrateur", inversedBy="matieres")
     */
    private $administrateur;

    /**
     * @ORM\OneToMany(targetEntity="App\Entity\Absence", mappedBy="matiere" , orphanRemoval=true)
     * @ApiSubresource()
     */
    private $absences;

    /**
     * @ORM\OneToMany(targetEntity="App\Entity\Exam", mappedBy="matiere"  , orphanRemoval=true)
     * @ApiSubresource()
     */
    private $exams;
 // cascade={"remove"}
    public function __construct()
    {
        $this->absences = new ArrayCollection();
        $this->exams = new ArrayCollection();
    }

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getNom(): ?string
    {
        return $this->nom;
    }

    public function setNom(string $nom): self
    {
        $this->nom = $nom;

        return $this;
    }

    public function getNbrHeure(): ?float
    {
        return $this->nbr_heure;
    }

    public function setNbrHeure(float $nbr_heure): self
    {
        $this->nbr_heure = $nbr_heure;

        return $this;
    }

    public function getSalle(): ?string
    {
        return $this->salle;
    }

    public function setSalle(string $salle): self
    {
        $this->salle = $salle;

        return $this;
    }

    public function getDate(): ?\DateTimeInterface
    {
        return $this->date;
    }

    public function setDate(\DateTimeInterface $date): self
    {
        $this->date = $date;

        return $this;
    }

    public function getClasse(): ?Classe
    {
        return $this->classe;
    }

    public function setClasse(?Classe $classe): self
    {
        $this->classe = $classe;

        return $this;
    }


    public function getAdministrateur(): ?Administrateur
    {
        return $this->administrateur;
    }

    public function setAdministrateur(?Administrateur $administrateur): self
    {
        $this->administrateur = $administrateur;

        return $this;
    }

    /**
     * @return Collection|Absence[]
     */
    public function getAbsences(): Collection
    {
        return $this->absences;
    }

    public function addAbsence(Absence $absence): self
    {
        if (!$this->absences->contains($absence)) {
            $this->absences[] = $absence;
            $absence->setMatiere($this);
        }

        return $this;
    }

    public function removeAbsence(Absence $absence): self
    {
        if ($this->absences->contains($absence)) {
            $this->absences->removeElement($absence);
            // set the owning side to null (unless already changed)
            if ($absence->getMatiere() === $this) {
                $absence->setMatiere(null);
            }
        }

        return $this;
    }

    /**
     * @return Collection|Exam[]
     */
    public function getExams(): Collection
    {
        return $this->exams;
    }

    public function addExam(Exam $exam): self
    {
        if (!$this->exams->contains($exam)) {
            $this->exams[] = $exam;
            $exam->setMatiere($this);
        }

        return $this;
    }

    public function removeExam(Exam $exam): self
    {
        if ($this->exams->contains($exam)) {
            $this->exams->removeElement($exam);
            // set the owning side to null (unless already changed)
            if ($exam->getMatiere() === $this) {
                $exam->setMatiere(null);
            }
        }

        return $this;
    }

    public function __toString()
    {
        return $this->getNom();
    }
}
