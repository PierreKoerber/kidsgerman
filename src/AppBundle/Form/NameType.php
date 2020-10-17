<?php

namespace AppBundle\Form;

use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;
use Symfony\Component\Form\Extension\Core\Type\ChoiceType;

class NameType extends AbstractType
{
    /**
     * {@inheritdoc}
     */
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $builder
        ->add('article', ChoiceType::class, array(
            'choices'  => array(
                'der' => 'der',
                'die' => 'die',
                'das' => 'das',
                'vide' => ''
            ),))
         //   ->add('article')
        ->add('name')
        ->add('plural')
        ->add('translation')
        ->add('type', ChoiceType::class, array(
            'choices'  => array(
                'nom' => 'nom',
                'adjectif' => 'adjectif',
                'verbe' => 'verbe',
                'adverbe' => 'adverbe',
                'expression' => 'expression',
                'préposition' => 'préposition',
                'pronom' => 'pronom',
                'conjonction' => 'conjonction',
                'préposition indéfinie' => 'préposition indéfinie',

            ),))
        ->add('lesson');
    }/**
     * {@inheritdoc}
     */
    public function configureOptions(OptionsResolver $resolver)
    {
        $resolver->setDefaults(array(
            'data_class' => 'AppBundle\Entity\Name'
        ));
    }

    /**
     * {@inheritdoc}
     */
    public function getBlockPrefix()
    {
        return 'appbundle_name';
    }


}
