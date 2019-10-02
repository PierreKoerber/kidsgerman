<?php

namespace AppBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * Name
 *
 * @ORM\Table(name="name")
 * @ORM\Entity(repositoryClass="AppBundle\Repository\NameRepository")
 */
class Name
{

    public function __toString(){
        return  $this->getName() . " " . $this->getArticle() ;
    }


    /**
     * @ORM\ManyToOne(targetEntity="lesson", inversedBy="words")
     * @ORM\JoinColumn(name="lesson_id", referencedColumnName="id")
     */
    private $lesson ;

    /**
     * @ORM\OneToMany(targetEntity="Sentence", mappedBy="word")
     **/
    private $sentences ;

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
     * @ORM\Column(name="article", type="string", length=15, nullable=true)
     */
    private $article;


    /**
     * @var string
     *
     * @ORM\Column(name="name", type="string", length=255)
     */
    private $name;

    /**
     * @var string
     *
     * @ORM\Column(name="plural", type="string", length=25, nullable=true)
     */
    private $plural;

    /**
     * @var string
     *
     * @ORM\Column(name="translation", type="string", length=255)
     */
    private $translation;

     /**
     * @var string
     *
     * @ORM\Column(name="type", type="string", length=50)
     */
    private $type;

    


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
     * Set article
     *
     * @param string $article
     *
     * @return Name
     */
    public function setArticle($article)
    {
        $this->article = $article;

        return $this;
    }

    /**
     * Get article
     *
     * @return string
     */
    public function getArticle()
    {
        return $this->article;
    }

    /**
     * Set name
     *
     * @param string $name
     *
     * @return Name
     */
    public function setName($name)
    {
        $this->name = $name;

        return $this;
    }

    /**
     * Get name
     *
     * @return string
     */
    public function getName()
    {
        return $this->name;
    }

    /**
     * Set plural
     *
     * @param string $plural
     *
     * @return Name
     */
    public function setPlural($plural)
    {
        $this->plural = $plural;

        return $this;
    }

    /**
     * Get plural
     *
     * @return string
     */
    public function getPlural()
    {
        return $this->plural;
    }

    /**
     * Set translation
     *
     * @param string $translation
     *
     * @return Name
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
     * Set type
     *
     * @param string $type
     *
     * @return Name
     */
    public function setType($type)
    {
        $this->type = $type;

        return $this;
    }

    /**
     * Get type
     *
     * @return string
     */
    public function getType()
    {
        return $this->type;
    }

    /**
     * Set lesson
     *
     * @param \AppBundle\Entity\lesson $lesson
     *
     * @return Name
     */
    public function setLesson(\AppBundle\Entity\lesson $lesson = null)
    {
        $this->lesson = $lesson;

        return $this;
    }

    /**
     * Get lesson
     *
     * @return \AppBundle\Entity\lesson
     */
    public function getLesson()
    {
        return $this->lesson;
    }
    /**
     * Constructor
     */
    public function __construct()
    {
        $this->sentences = new \Doctrine\Common\Collections\ArrayCollection();
    }

    /**
     * Add sentence
     *
     * @param \AppBundle\Entity\Sentence $sentence
     *
     * @return Name
     */
    public function addSentence(\AppBundle\Entity\Sentence $sentence)
    {
        $this->sentences[] = $sentence;

        return $this;
    }

    /**
     * Remove sentence
     *
     * @param \AppBundle\Entity\Sentence $sentence
     */
    public function removeSentence(\AppBundle\Entity\Sentence $sentence)
    {
        $this->sentences->removeElement($sentence);
    }

    /**
     * Get sentences
     *
     * @return \Doctrine\Common\Collections\Collection
     */
    public function getSentences()
    {
        return $this->sentences;
    }
}
