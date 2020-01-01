<?php

namespace App\Entity;

use ApiPlatform\Core\Annotation\ApiResource;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;
use ApiPlatform\Core\Annotation\ApiSubresource;
use Symfony\Component\Serializer\Annotation\Groups;

/**
 * @ApiResource(
 *  itemOperations={
 *      "GET"={
 *        "normalization_context"={
 *          "groups"={"get-classe-with-etd"}
 *         }
 *      }
 * }
 * )
 * @ORM\Entity(repositoryClass="App\Repository\ClasseRepository")
 */
class Classe
{
    /**
     * @ORM\Id()
     * @ORM\GeneratedValue()
     * @ORM\Column(type="integer")
     * @Groups({"get-classe-with-etd"})
     */
    private $id;

    /**
     * @ORM\Column(type="string", length=10)
     * @Groups({"get-classe-with-etd"})
     */
    private $nom;

    /**
     * @ORM\Column(type="string", length=20)
     * @Groups({"get-classe-with-etd"})
     */
    private $filiere;

    /**
     * @ORM\Column(type="string", length=30)
     * @Groups({"get-classe-with-etd"})
     */
    private $promotion;

    /**
     * @ORM\Column(type="string", length=255)
     * @Groups({"get-classe-with-etd"})
     */
    private $emploi;

    /**
     * @ORM\OneToMany(targetEntity="App\Entity\Etudiant", mappedBy="classe" , orphanRemoval=true)
     * @Groups({"get-classe-with-etd"})
     * @ApiSubresource()
     */
    private $etudiants;

    /**
     * @ORM\OneToMany(targetEntity="App\Entity\Matiere", mappedBy="classe" , orphanRemoval=true)
     * @Groups({"get-classe-with-etd"})
     * @ApiSubresource()
     */
    private $matieres;
    

    /**
     * @ORM\ManyToOne(targetEntity="App\Entity\Administrateur", inversedBy="classes")
     */
    private $administrateur;

    public function __construct()
    {
        $this->etudiants = new ArrayCollection();
        $this->matieres = new ArrayCollection();
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

    public function getFiliere(): ?string
    {
        return $this->filiere;
    }

    public function setFiliere(string $filiere): self
    {
        $this->filiere = $filiere;

        return $this;
    }

    public function getPromotion(): ?string
    {
        return $this->promotion;
    }

    public function setPromotion(string $promotion): self
    {
        $this->promotion = $promotion;

        return $this;
    }

    public function getEmploi(): ?string
    {
        return $this->emploi;
    }

    public function setEmploi(string $emploi): self
    {
        $this->emploi = $emploi;

        return $this;
    }

    /**
     * @return Collection|Etudiant[]
     */
    public function getEtudiants(): Collection
    {
        return $this->etudiants;
    }

    public function addEtudiant(Etudiant $etudiant): self
    {
        if (!$this->etudiants->contains($etudiant)) {
            $this->etudiants[] = $etudiant;
            $etudiant->setClasse($this);
        }

        return $this;
    }

    public function removeEtudiant(Etudiant $etudiant): self
    {
        if ($this->etudiants->contains($etudiant)) {
            $this->etudiants->removeElement($etudiant);
            // set the owning side to null (unless already changed)
            if ($etudiant->getClasse() === $this) {
                $etudiant->setClasse(null);
            }
        }

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
        return $this->getNom();
    }

    /**
     * @return Collection|Matiere[]
     */
    public function getMatieres(): Collection
    {
        return $this->matieres;
    }

    public function addMatiere(Matiere $matiere): self
    {
        if (!$this->matieres->contains($matiere)) {
            $this->matieres[] = $matiere;
            $matiere->setClasse($this);
        }

        return $this;
    }

    public function removeMatiere(Matiere $matiere): self
    {
        if ($this->matieres->contains($matiere)) {
            $this->matieres->removeElement($matiere);
            // set the owning side to null (unless already changed)
            if ($matiere->getClasse() === $this) {
                $matiere->setClasse(null);
            }
        }

        return $this;
    }
}
