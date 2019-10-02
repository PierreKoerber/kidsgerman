<?php

namespace AppBundle\Controller;

use AppBundle\Entity\Sentence;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Method;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;use Symfony\Component\HttpFoundation\Request;

/**
 * Sentence controller.
 *
 * @Route("sentence")
 */
class SentenceController extends Controller
{
    /**
     * Lists all sentence entities.
     *
     * @Route("/", name="sentence_index")
     * @Method("GET")
     */
    public function indexAction()
    {
        $em = $this->getDoctrine()->getManager();

        $sentences = $em->getRepository('AppBundle:Sentence')->findAll();

        return $this->render('sentence/index.html.twig', array(
            'sentences' => $sentences,
        ));
    }

    /**
     * Creates a new sentence entity.
     *
     * @Route("/new", name="sentence_new")
     * @Method({"GET", "POST"})
     */
    public function newAction(Request $request)
    {
        $sentence = new Sentence();
        $form = $this->createForm('AppBundle\Form\SentenceType', $sentence);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $em = $this->getDoctrine()->getManager();
            $em->persist($sentence);
            $em->flush();

            return $this->redirectToRoute('sentence_show', array('id' => $sentence->getId()));
        }

        return $this->render('sentence/new.html.twig', array(
            'sentence' => $sentence,
            'form' => $form->createView(),
        ));
    }

    /**
     * Finds and displays a sentence entity.
     *
     * @Route("/{id}", name="sentence_show")
     * @Method("GET")
     */
    public function showAction(Sentence $sentence)
    {
        $deleteForm = $this->createDeleteForm($sentence);

        return $this->render('sentence/show.html.twig', array(
            'sentence' => $sentence,
            'delete_form' => $deleteForm->createView(),
        ));
    }

    /**
     * Displays a form to edit an existing sentence entity.
     *
     * @Route("/{id}/edit", name="sentence_edit")
     * @Method({"GET", "POST"})
     */
    public function editAction(Request $request, Sentence $sentence)
    {
        $deleteForm = $this->createDeleteForm($sentence);
        $editForm = $this->createForm('AppBundle\Form\SentenceType', $sentence);
        $editForm->handleRequest($request);

        if ($editForm->isSubmitted() && $editForm->isValid()) {
            $this->getDoctrine()->getManager()->flush();

            return $this->redirectToRoute('sentence_edit', array('id' => $sentence->getId()));
        }

        return $this->render('sentence/edit.html.twig', array(
            'sentence' => $sentence,
            'edit_form' => $editForm->createView(),
            'delete_form' => $deleteForm->createView(),
        ));
    }

    /**
     * Deletes a sentence entity.
     *
     * @Route("/{id}", name="sentence_delete")
     * @Method("DELETE")
     */
    public function deleteAction(Request $request, Sentence $sentence)
    {
        $form = $this->createDeleteForm($sentence);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $em = $this->getDoctrine()->getManager();
            $em->remove($sentence);
            $em->flush();
        }

        return $this->redirectToRoute('sentence_index');
    }

    /**
     * Creates a form to delete a sentence entity.
     *
     * @param Sentence $sentence The sentence entity
     *
     * @return \Symfony\Component\Form\Form The form
     */
    private function createDeleteForm(Sentence $sentence)
    {
        return $this->createFormBuilder()
            ->setAction($this->generateUrl('sentence_delete', array('id' => $sentence->getId())))
            ->setMethod('DELETE')
            ->getForm()
        ;
    }
}
