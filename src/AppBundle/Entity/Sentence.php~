<?php

namespace AppBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * Name
 *
 * @ORM\Table(name="sentence")
 * @ORM\Entity(repositoryClass="AppBundle\Repository\NameRepository")
 */
class Sentence
{

    /**
     * @ORM\ManyToOne(targetEntity="Name", inversedBy="sentences")
     * @ORM\JoinColumn(name="word_id", referencedColumnName="id")
     */
    private $word ;

    /**
     * @var int
     *
     * @ORM\Column(name="id", type="integer")
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="AUTO")
     */
    private $id;

    /**
     * @var string
     *
     * @ORM\Column(name="text", type="string", length=255)
     */
    private $text;

    /**
     * @var string
     *
     * @ORM\Column(name="translation", type="string", length=255)
     */
    private $translation;

    
    


    /**
     * Get id
     *
     * @return int
     */
    public function getId()
    {
        return $this->id;
    }

   





    /**
     * Set text
     *
     * @param string $text
     *
     * @return Sentence
     */
    public function setText($text)
    {
        $this->text = $text;

        return $this;
    }

    /**
     * Get text
     *
     * @return string
     */
    public function getText()
    {
        return $this->text;
    }

    /**
     * Set translation
     *
     * @param string $translation
     *
     * @return Sentence
     */
    public function setTranslation($translation)
    {
        $this->translation = $translation;

        return $this;
    }

    /**
     * Get translation
     *
     * @return string
     */
    public function getTranslation()
    {
        return $this->translation;
    }

    /**
     * Set word
     *
     * @param \AppBundle\Entity\name $word
     *
     * @return Sentence
     */
    public function setWord(\AppBundle\Entity\name $word = null)
    {
        $this->word = $word;

        return $this;
    }

    /**
     * Get word
     *
     * @return \AppBundle\Entity\name
     */
    public function getWord()
    {
        return $this->word;
    }
}
