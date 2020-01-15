<?php

namespace App\Entity;

use ApiPlatform\Core\Annotation\ApiResource;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;
use Symfony\Component\Security\Core\User\UserInterface;
use ApiPlatform\Core\Annotation\ApiSubresource;
use Symfony\Component\Serializer\Annotation\Groups;
use Symfony\Bridge\Doctrine\Validator\Constraints\UniqueEntity;


/**
 * @ApiResource(
 * itemOperations={
 *      "PUT",
 *      "GET"={
 *        "normalization_context"={
 *          "groups"={"get-etd-with-exam"}
 * 
 *         }
 *      }
 * }
 * )
 * @ORM\Entity(repositoryClass="App\Repository\EtudiantRepository")
 * @UniqueEntity("email")
 */
class Etudiant implements UserInterface
{
    /**
     * @ORM\Id()
     * @ORM\GeneratedValue()
     * @ORM\Column(type="integer")
     *  @Groups({"get-etd-with-exam" })
     */
    protected $id;

    /**
     * @ORM\Column(type="string", length=50)
     * @Groups({"get-etd-with-exam"})
     */
    protected $nom;

    /**
     * @ORM\Column(type="string", length=30)
     * @Groups({"get-etd-with-exam"})
     */
    protected $prenom;

    /**
     * @ORM\Column(type="string", length=255)
     * @Groups({"get-etd-with-exam" })
     */
    protected $role;

    /**
     * @ORM\Column(type="string", length=50)
     * @Groups({"get-etd-with-exam"})
     */
    protected $email;

    /**
     * @ORM\Column(type="string", length=255)
     */
    protected $password;

    /**
     * @ORM\Column(type="string", length=20)
     * @Groups({"get-etd-with-exam"})
     */
    protected $tel;

    /**
     * @ORM\Column(type="string", length=255)
     * @Groups({"get-etd-with-exam" })
     */
    private $code_etd;

    /**
     * @ORM\ManyToOne(targetEntity="App\Entity\Administrateur", inversedBy="etudiants")
     */
    private $administrateur;

    /**
     * @ORM\ManyToOne(targetEntity="App\Entity\Classe", inversedBy="etudiants")
     * @Groups({"get-etd-with-exam" })
     */
    private $classe;
 
    /**
     * @ORM\OneToMany(targetEntity="App\Entity\Absence", mappedBy="etudiant" , orphanRemoval=true)
     *  @ApiSubresource()
     *  @Groups({"get-etd-with-exam" })
     */
    private $absences;
 
    /**
     * @ORM\OneToMany(targetEntity="App\Entity\Exam", mappedBy="etudiant" , orphanRemoval=true)
     * @ApiSubresource()
     * @Groups({"get-etd-with-exam" })
     */
    private $exams;

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

    public function getPrenom(): ?string
    {
        return $this->prenom;
    }

    public function setPrenom(string $prenom): self
    {
        $this->prenom = $prenom;

        return $this;
    }

    public function getRole(): ?string
    {
        return $this->role;
    }

    public function setRole(string $role): self
    {
        $this->role = $role;

        return $this;
    }

    public function getEmail(): ?string
    {
        return $this->email;
    }

    public function setEmail(string $email): self
    {
        $this->email = $email;

        return $this;
    }

    public function getPassword(): ?string
    {
        return $this->password;
    }

    public function setPassword(string $password): self
    {
        $this->password = $password;

        return $this;
    }

    public function getTel(): ?string
    {
        return $this->tel;
    }

    public function setTel(string $tel): self
    {
        $this->tel = $tel;

        return $this;
    }
 
    public function getCodeEtd(): ?string
    {
        return $this->code_etd;
    }

    public function setCodeEtd(string $code_etd): self
    {
        $this->code_etd = $code_etd;

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

    public function getClasse(): ?Classe
    {
        return $this->classe;
    }

    public function setClasse(?Classe $classe): self
    {
        $this->classe = $classe;

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
            $absence->setEtudiant($this);
        }

        return $this;
    }

    public function removeAbsence(Absence $absence): self
    {
        if ($this->absences->contains($absence)) {
            $this->absences->removeElement($absence);
            // set the owning side to null (unless already changed)
            if ($absence->getEtudiant() === $this) {
                $absence->setEtudiant(null);
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
            $exam->setEtudiant($this);
        }

        return $this;
    }

    public function removeExam(Exam $exam): self
    {
        if ($this->exams->contains($exam)) {
            $this->exams->removeElement($exam);
            // set the owning side to null (unless already changed)
            if ($exam->getEtudiant() === $this) {
                $exam->setEtudiant(null);
            }
        }

        return $this;
    }

    public function __toString()
    {
        return $this->getNom();
    }

    
    /**
     * Returns the roles granted to the user.
     *
     *     public function getRoles()
     *     {
     *         return ['ROLE_USER'];
     *     }
     *
     * Alternatively, the roles might be stored on a ``roles`` property,
     * and populated in any number of different ways when the user object
     * is created.
     *
     * @return string[] The user roles
     */
    public function getRoles(){
        return ['ROLE_USER'];
    }

    /**
     * Returns the salt that was originally used to encode the password.
     *
     * This can return null if the password was not encoded using a salt.
     *
     * @return string|null The salt
     */
    public function getSalt(){
        return null;
    }

    /**
     * Removes sensitive data from the user.
     *
     * This is important if, at any given point, sensitive information like
     * the plain-text password is stored on this object.
     */
    public function eraseCredentials(){

    }

    /**
     * Returns the username used to authenticate the user.
     *
     * @return string The username
     */
    public function getUsername(){
        return $this->code_etd;
    }
}
