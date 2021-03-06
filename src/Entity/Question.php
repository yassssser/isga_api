<?php

namespace App\Entity;

use ApiPlatform\Core\Annotation\ApiResource;
use Doctrine\ORM\Mapping as ORM;
use Symfony\Component\Serializer\Annotation\Groups;

/**
 * @ApiResource()
 * @ORM\Entity(repositoryClass="App\Repository\QuestionRepository")
 */
class Question
{
    /**
     * @ORM\Id()
     * @ORM\GeneratedValue()
     * @ORM\Column(type="integer")
     * @Groups({"get-qst-with-quiz"})
     */
    private $id;

    /**
     * @ORM\Column(type="string", length=255)
     * @Groups({"get-qst-with-quiz"})
     */
    private $ques;

    /**
     * @ORM\Column(type="boolean")
     * @Groups({"get-qst-with-quiz"})
     */
    private $rep;

    /**
     * @ORM\Column(type="string", length=255)
     * @Groups({"get-qst-with-quiz"})
     */
    private $justification;
 
    /**
     * @ORM\ManyToOne(targetEntity="App\Entity\Quiz", inversedBy="questions")
     * @ORM\JoinColumn(nullable=false)
     */
    private $Quiz;

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getQues(): ?string
    {
        return $this->ques;
    }

    public function setQues(string $ques): self
    {
        $this->ques = $ques;

        return $this;
    }

    public function getRep(): ?bool
    {
        return $this->rep;
    }

    public function setRep(bool $rep): self
    {
        $this->rep = $rep;

        return $this;
    }

    public function getJustification(): ?string
    {
        return $this->justification;
    }

    public function setJustification(string $justification): self
    {
        $this->justification = $justification;

        return $this;
    }

    public function getQuiz(): ?Quiz
    {
        return $this->Quiz;
    }

    public function setQuiz(?Quiz $Quiz): self
    {
        $this->Quiz = $Quiz;

        return $this;
    }
}
