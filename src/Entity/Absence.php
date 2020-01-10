<?php

namespace App\Entity;

use ApiPlatform\Core\Annotation\ApiResource;
use Doctrine\ORM\Mapping as ORM;
use Symfony\Component\Serializer\Annotation\Groups;
use ApiPlatform\Core\Annotation\ApiSubresource;

/**
 * @ApiResource()
 * @ORM\Entity(repositoryClass="App\Repository\AbsenceRepository")
 */
class Absence
{
    /**
     * @ORM\Id()
     * @ORM\GeneratedValue()
     * @ORM\Column(type="integer")
     * @Groups({"get-etd-with-exam"})
     */
    private $id;

    /**
     * @ORM\Column(type="date")
     * @Groups({"get-etd-with-exam"})
     */
    private $date;

    /**
     * @ORM\Column(type="boolean")
     * @Groups({"get-etd-with-exam"})
     */
    private $justification;

    /**
     * @ORM\Column(type="float")
     * @Groups({"get-etd-with-exam"})
     */
    private $nbrHeure;

    /**
     * @ORM\ManyToOne(targetEntity="App\Entity\Etudiant", inversedBy="absences")
     */
    private $etudiant;

    /**
     * @ORM\ManyToOne(targetEntity="App\Entity\Matiere", inversedBy="absences")
     * @Groups({"get-etd-with-exam"})
     */
    private $matiere;

    /**
     * @ORM\ManyToOne(targetEntity="App\Entity\Administrateur", inversedBy="absences")
     */
    private $administrateur;

    public function getId(): ?int
    {
        return $this->id;
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

    public function getJustification(): ?bool
    {
        return $this->justification;
    }

    public function setJustification(bool $justification): self
    {
        $this->justification = $justification;

        return $this;
    }

    public function getNbrHeure(): ?float
    {
        return $this->nbrHeure;
    }

    public function setNbrHeure(float $nbrHeure): self
    {
        $this->nbrHeure = $nbrHeure;

        return $this;
    }

    public function getEtudiant(): ?Etudiant
    {
        return $this->etudiant;
    }

    public function setEtudiant(?Etudiant $etudiant): self
    {
        $this->etudiant = $etudiant;

        return $this;
    }

    public function getMatiere(): ?Matiere
    {
        return $this->matiere;
    }

    public function setMatiere(?Matiere $matiere): self
    {
        $this->matiere = $matiere;

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

    public function __toString()
    {
        return "Absence ";
    }
}
