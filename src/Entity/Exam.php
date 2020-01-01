<?php

namespace App\Entity;

use ApiPlatform\Core\Annotation\ApiResource;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;
use Symfony\Component\Serializer\Annotation\Groups;
use ApiPlatform\Core\Annotation\ApiSubresource;

/**
 * @ApiResource(
 *  *  itemOperations={
 *      "GET"={
 *        "normalization_context"={
 *          "groups"={"get-matiere-with-exam"}
 *         }
 *      }
 * }
 * )
 * @ORM\Entity(repositoryClass="App\Repository\ExamRepository")
 */
class Exam
{
    /**
     * @ORM\Id()
     * @ORM\GeneratedValue()
     * @ORM\Column(type="integer")
     * @Groups({"get-etd-with-exam" , "get-matiere-with-exam"})
     */
    private $id;

    /**
     * @ORM\Column(type="datetime")
     * @Groups({"get-etd-with-exam" , "get-matiere-with-exam"})
     */
    private $date;

    /**
     * @ORM\Column(type="float", nullable=true)
     * @Groups({"get-etd-with-exam" , "get-matiere-with-exam"})
     */
    private $note;

    /**
     * @ORM\Column(type="boolean", nullable=true)
     * @Groups({"get-etd-with-exam" , "get-matiere-with-exam"})
     */
    private $validation;

    /**
     * @ORM\Column(type="string", length=255)
     * @Groups({"get-etd-with-exam" , "get-matiere-with-exam"})
     */
    private $nom;

    /**
     * @ORM\ManyToOne(targetEntity="App\Entity\Matiere", inversedBy="exams")
     * @Groups({"get-matiere-with-exam"})
     */
    private $matiere;

    /**
     * @ORM\ManyToOne(targetEntity="App\Entity\Administrateur", inversedBy="exams")
     */
    private $administrateur;

    /**
     * @ORM\ManyToOne(targetEntity="App\Entity\Etudiant", inversedBy="exams")
     * @Groups({"get-matiere-with-exam"})
     */
    private $etudiant;

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

    public function getNote(): ?float
    {
        return $this->note;
    }

    public function setNote(?float $note): self
    {
        $this->note = $note;

        return $this;
    }

    public function getValidation(): ?bool
    {
        return $this->validation;
    }

    public function setValidation(?bool $validation): self
    {
        $this->validation = $validation;

        return $this;
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

    public function getEtudiant(): ?Etudiant
    {
        return $this->etudiant;
    }

    public function setEtudiant(?Etudiant $etudiant): self
    {
        $this->etudiant = $etudiant;

        return $this;
    }

    public function __toString()
    {
        return $this->getNom();
    }
}
