<?php

namespace App\Entity;

use App\Repository\LangageRepository;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;

/**
 * @ORM\Entity(repositoryClass="App\Repository\LangageRepository")
 */
class Langage
{
    /**
     * @ORM\Id
     * @ORM\GeneratedValue
     * @ORM\Column(type="integer")
     */
    private $id;

    /**
     * @ORM\Column(type="string", length=255)
     */
    private $nom;

    /**
     * @ORM\OneToMany(targetEntity="App\Entity\Projet", mappedBy="langage")
     */
    private $lesProjets;

    public function __construct()
    {
        $this->lesProjets = new ArrayCollection();
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

    /**
     * @return Collection|Projet[]
     */
    public function getLesProjets(): Collection
    {
        return $this->lesProjets;
    }

    public function addLesProjet(Projet $lesProjet): self
    {
        if (!$this->lesProjets->contains($lesProjet)) {
            $this->lesProjets[] = $lesProjet;
            $lesProjet->setLangage($this);
        }

        return $this;
    }

    public function removeLesProjet(Projet $lesProjet): self
    {
        if ($this->lesProjets->contains($lesProjet)) {
            $this->lesProjets->removeElement($lesProjet);
            // set the owning side to null (unless already changed)
            if ($lesProjet->getLangage() === $this) {
                $lesProjet->setLangage(null);
            }
        }

        return $this;
    }

    public function __toString() {
        return $this->nom;
    }
}
